//
//  ViewController.swift
//  YTMoyaDemo
//
//  Created by MTPC-283 on 14/08/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private var viewModel = ViewModel()
    var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUser(id: "2")
        
        viewModel.userResponse.subscribe { userResponse in
           // print(userResponse.element)
        }.disposed(by: bag)

        viewModel.fetchAllUser()
        
        viewModel.loginUser()
        
    }


}

