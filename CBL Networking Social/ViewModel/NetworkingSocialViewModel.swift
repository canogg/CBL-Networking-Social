//
//  NetworkingSocialViewModel.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

class CreatVC: UIViewController {
    
    var screen: PostView?
    var user: UsersModel?
    
    override func loadView() {
        self.screen = PostView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            screen?.posts = await API.getPosts()
            screen?.tableView.reloadData()
            print(screen?.posts.count)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension CreatVC: sendUserDelegate{
    
    func registerUser(loginTextField: String, emailTextField: String, passwordTextField: String) {
        user = UsersModel(name: loginTextField, email: emailTextField, password: passwordTextField)

        
        API.createUser(user: user!)
    }

}

