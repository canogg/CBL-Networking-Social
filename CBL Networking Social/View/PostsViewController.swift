//
//  PostsViewController.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 18/08/22.
//

import UIKit

class PostsViewController: UIViewController, PostViewDelegate {

    var screen: PostView = PostView()
    
    override func loadView() {
        super.loadView()
        screen.delegate = self
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
    }
    
    func loadTableView() {
        Task {
            screen.posts = await API.getPosts()
            screen.tableView.reloadData()
            print(screen.posts)
        }
    }
    
    func sendPost(text: String) {
        API.sendPost(texto: text)
        loadTableView()
    }
    

}
