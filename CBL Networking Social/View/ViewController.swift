//
//  ViewController.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

class ViewModel {
    let textoAPI: String = "Coisa que vem da API"
}

class ViewController: UIViewController {

    // navegacao \\self.present...
    // criação das views que vao pra tela // self.view.addSubview(...)
    let viewModel: ViewModel = ViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        //API.createUser()
//        label.text = viewModel.textoAPI
        // Do any additional setup after loading the view.
    }

   
}

