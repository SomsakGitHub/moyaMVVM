//
//  ViewModel.swift
//  YTMoyaDemo
//
//  Created by MTPC-283 on 14/08/22.
//

import Foundation
import Moya
import RxSwift

class ViewModel {
    
    private let service:MoyaProvider<MoyaService>
    private var bag = DisposeBag()
    var userResponse = PublishSubject<UserResponse>()
    
    init(service:MoyaProvider<MoyaService> = MoyaProvider<MoyaService>()) {
        self.service = service
    }
    
    func fetchUser(id:String) {
        service.rx.request(.getUser(userId: id)).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                do {
                   // print(response.request?.url)
                    let filterResponse = try response.filterSuccessfulStatusCodes()
                    let userResponse = try filterResponse.map(UserResponse.self,using: JSONDecoder())
                    self?.userResponse.onNext(userResponse)
                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }.disposed(by: bag)

    }
    
    func fetchAllUser() {
        service.rx.request(.getAllUser(page: "2")).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                do {
                   // print(response.request?.url)
                   // let filterResponse = try response.filterSuccessfulStatusCodes()
                  //  print(try response.mapJSON())
                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }.disposed(by: bag)

    }
    
    func loginUser() {
        service.rx.request(.login(email: "eve.holt@reqres.in", password: "cityslicka")).subscribe { [weak self] event in
            switch event {
            case let .success(response):
                do {
                   // print(response.request?.url)
                   // let filterResponse = try response.filterSuccessfulStatusCodes()
                    print(try response.mapJSON())
                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }.disposed(by: bag)

    }
    
}
