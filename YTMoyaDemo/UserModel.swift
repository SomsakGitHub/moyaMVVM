//
//  UserModel.swift
//  YTMoyaDemo
//
//  Created by MTPC-283 on 14/08/22.
//

import Foundation

import Foundation

// MARK: - User
struct UserResponse: Codable {
    let data: User
}

// MARK: - DataClass
struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
