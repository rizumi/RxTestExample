//
//  ViewModel.swift
//  RxTestExample
//
//  Created by ryo.izumi on 2020/05/21.
//  Copyright © 2020 izm. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    func next(_ str: String) {
        examplePublishSubject.onNext(str)
    }
    
    func complete() {
        examplePublishSubject.onCompleted()
    }
    
    private var examplePublishSubject = PublishSubject<String>()
    var exampleObservable: Observable<String> {
        return examplePublishSubject.asObservable()
    }
}
