//
//  UsersModel.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import Foundation


struct UsersModel: Codable, Equatable {

    var id: UUID
    var name: String
    var email: String
    var avatar: String?
    var password: String?
    
//    init(name: String, email: String, password: String) {
//        self.name = name
//        self.email = email
//    }
}

extension UsersModel {
    struct withToken: Codable, Equatable {
        let token: String
        let user: UsersModel
    }
    
    struct autentication: Codable, Equatable {
        let username: String
        let password:String
    }
}

