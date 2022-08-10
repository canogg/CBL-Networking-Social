//
//  NetworkingSocialViewModel.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

class CreatVC: UIViewController {
    
    var screen: CreateUserView?
    
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

