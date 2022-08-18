//
//  CreatVC.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

class CreatVC: UIViewController {
    
    var screen: LoginView = LoginView()
    var user: UsersModel?
    
    override func loadView() {
        super.loadView()
        self.view = self.screen
        self.screen.createVC = self // injecao da controller como dependencia da View
        // Pesquisar sobre Memory Leaks, Reain Cycles e ARC, weak properties
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        API.sendPost()
        //        Task {
        //            let token = try await API.postLogin()
        //            print(token)
        //        }
        //        Task {
        //            screen?.posts = await API.getPosts()
        //            screen?.tableView.reloadData()
        //            print(screen?.posts)
        //        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension CreatVC: sendUserDelegate{
    
    func registerUser(loginTextField: String, emailTextField: String, passwordTextField: String) {
        user = UsersModel(id: UUID(),name: loginTextField, email: emailTextField, password: passwordTextField)
        
        
        API.createUser(user: user!)
    }
    
    func loginUser(loginTextField: String, emailTextField: String, passwordTextField: String) {
        
        user = UsersModel(id: UUID(),name: loginTextField, email: emailTextField, password: passwordTextField)
        
        Task {
            do {
                let user = try await API.postLogin(user: user!)
                self.goToPostViewController()
            } catch {
                print(error)
            }
        }
        
        //            API.sendPost()
        
        //        API.sendPost()
    }
    
    func goToPostViewController() {
//        DispatchQueue.main.async {
            let postViewController = PostsViewController()
//            postViewController.view.backgroundColor = .red
//            postViewController.screen?.backgroundColor = .green
//            self.present(postViewController, animated: true)
            self.navigationController?.pushViewController(postViewController, animated: true)
//        }
    }
    
}

