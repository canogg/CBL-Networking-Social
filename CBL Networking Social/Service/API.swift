//
//  API.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import Foundation

class API {
    
    static func createUser (user: UsersModel) {
        
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        do {
            let user = UsersModel(id: UUID(),name: user.name, email: user.email, password: user.password)
            let encoder = JSONEncoder()
            urlRequest.httpBody = try encoder.encode(user)
            let session = URLSession.shared
            
            
            let dataTask = session.dataTask(with: urlRequest) {data, response, error in
                guard
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    error == nil
                else {
                    print("error", error ?? URLError(.badServerResponse))
                    return
                }
                guard (200 ... 299) ~= response.statusCode else {
                    print("Não cadastrou, erro =  \(response)")
                    return
                }
                guard (500 ... 599) ~= response.statusCode else {
                    print("Cadastrou, status =  \(response.statusCode)")
                    print("data =  \(data)")
                    
                    let user = try! JSONDecoder().decode(UsersModel.withToken.self, from: data)
                    print(user.token)
                    return
                }
            }
            dataTask.resume()

        } catch {
            print(error)
        }
    }
//    static func login () {
//        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!)
//
//    }
    static func getPosts () async -> [PostsModel] {
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/posts")!)
        urlRequest.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let getPostsDecoded = try JSONDecoder().decode([PostsModel].self, from: data)
            print(getPostsDecoded)
            return getPostsDecoded
        } catch {
            print(error)
        }

        return []
    }
    
    static func postLogin() async throws -> UsersModel.withToken {
        
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users/login")!)
        urlRequest.httpMethod = "POST"
        
        let username = "Cicero@carol.com"
        let password = "Teste123"
        let loginString = "\(username):\(password)"
        
        let loginData = loginString.data(using: String.Encoding.utf8)!
        
        let based64LoginString = loginData.base64EncodedString()
        urlRequest.setValue("Basic \(based64LoginString)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        print("DEU CERTO\(data)")
        print(response)
        let user = try! JSONDecoder().decode(UsersModel.withToken.self, from: data)
//        urlRequest.httpBody = try JSONEncoder().encode(user)
        print("Usuario:\(user.token)")
//            let session = try JSONDecoder().decode(Session.self)
        return user
      
    }
}

