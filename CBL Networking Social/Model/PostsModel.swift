//
//  PostsModel.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import Foundation

class PostsModel: Codable {
    
    let id: String
    let content: String
    let user_id: String
    let created_at: String
    let updated_at: String
    
    init(id: String, content: String, user_id: String, created_at: String, updated_at: String) {
        self.id = id
        self.content = content
        self.user_id = user_id
        self.created_at = created_at
        self.updated_at = updated_at
    }
}

