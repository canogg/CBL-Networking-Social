//
//  UsersModel.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import Foundation


class UsersModel: Codable {

    
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}

