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
            let user = UsersModel(name: user.name, email: user.email, password: user.password)
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
            return getPostsDecoded
        } catch {
            print(error)
        }

        return []
    }

}

