//
//  NetworkingSocialViewModel.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

class CreatVC: UIViewController {
    
    var screen: CreateUserView?
    var user: UsersModel?
    
    override func loadView() {
        self.screen = CreateUserView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

}

extension CreatVC: sendUserDelegate{
    
    func registerUser(loginTextField: String, emailTextField: String, passwordTextField: String) {
        user?.name = loginTextField
        user?.email = emailTextField
        user?.password = passwordTextField
        
    }
//    func registerUser(){
//        API.createUser()
//    }
}

