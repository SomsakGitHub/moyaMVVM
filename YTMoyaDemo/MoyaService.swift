//
//  MoyaService.swift
//  YTMoyaDemo
//
//  Created by MTPC-283 on 14/08/22.
//

import Foundation
import Moya

enum MoyaService : TargetType {
   
    var baseURL: URL { return URL(string: "https://reqres.in")! }
    case getUser(userId:String)
    case getAllUser(page:String)
    case login(email:String,password:String)
    
    
    var path: String {
        switch self {
        case .getUser(let id):
            return "/api/users/\(id)"
        case .getAllUser(_):
            return "/api/users"
        case .login(_,_):
            return "/api/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser,.getAllUser:
            return .get
        case .login:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .getAllUser(let pageNo):
            return .requestParameters(parameters: ["page":pageNo], encoding: URLEncoding.default)
        case .login(let email,let password):
            return .requestParameters(parameters: ["email":email,"password" :password], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUser,.getAllUser,.login:
            return ["Accept":"application/json",
                    "Content-type":"application/json"]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getUser,.getAllUser,.login:
            return "should be filled properly".utf8Encoded
        }
    }
    
    
}

private extension String {
    var utf8Encoded:Data {
        return data(using: .utf8)!
    }
}
