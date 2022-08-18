//
//  CreateUserViewController.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 18/08/22.
//

import UIKit

extension CreateUserViewController: sendUserDelegate {
    func registerUser(loginTextField: String, emailTextField: String, passwordTextField: String) {
        goToPostViewController()
    }
}

class CreateUserViewController: UIViewController {
    
    var screen: CreateUserView = CreateUserView()
    
    override func loadView() {
        super.loadView()
        screen.delegate = self
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadTableView()
    }
    
    func goToPostViewController() {
        let postViewController = PostsViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
