//
//  ViewController.swift
//  RxTestExample
//
//  Created by ryo.izumi on 2020/05/21.
//  Copyright © 2020 izm. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vm = ViewModel()
        
        vm.exampleObservable
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: bag)

        vm.next("a")
        vm.next("b")
        vm.next("c")
        vm.complete()
    }
}

