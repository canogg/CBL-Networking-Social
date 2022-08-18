//
//  PostsViewController.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 18/08/22.
//

import UIKit

class PostsViewController: UIViewController {

    var screen: PostView = PostView()
    
    override func loadView() {
        super.loadView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            screen.posts = await API.getPosts()
            screen.tableView.reloadData()
            print(screen.posts)
        }
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
