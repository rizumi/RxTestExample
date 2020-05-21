//
//  RxTestExampleTests.swift
//  RxTestExampleTests
//
//  Created by ryo.izumi on 2020/05/21.
//  Copyright © 2020 izm. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

class RxTestExampleTests: XCTestCase {
    
    private let bag = DisposeBag()

    func testExample() {
        let vm = ViewModel()
        
        let scheduler = TestScheduler(initialClock: 0)
        scheduler.scheduleAt(0) {
            vm.next("aaa")
        }
        scheduler.scheduleAt(10) {
            vm.next("bbb")
        }
        scheduler.scheduleAt(20) {
            vm.complete()
        }
        
        let observer = scheduler.createObserver(String.self)
        vm.exampleObservable
            .subscribe(onNext: { value in
                observer.onNext(value)
            }, onCompleted: {
                observer.onCompleted()
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        XCTAssertEqual(observer.events, [
            Recorded.next(0, "aaa"),
            Recorded.next(10, "bbb"),
            Recorded.completed(20)
        ])
    }

}
