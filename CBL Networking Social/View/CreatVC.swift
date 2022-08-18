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

        do{
            API.createUser(user: user!)
            self.goToPostViewController()
        } catch {
            print(error)
        }
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
    }
    
    func goToPostViewController() {
            let postViewController = PostsViewController()
            self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    func goToCreateUserViewController() {
        let creatViewController = CreateUserViewController()
        self.navigationController?.pushViewController(creatViewController, animated: true)
    }
}

