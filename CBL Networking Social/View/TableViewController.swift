//
//  TableViewController.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 16/08/22.
//

import Foundation
import UIKit

class TableViewController: UIView,  UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    var posts: [PostsModel] = []
    
    override init (frame: CGRect){
        super.init(frame: frame)
        self.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
        
        Task {
            posts = await API.getPosts()
            tableView.reloadData()
            print(posts.count)
        }
//        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    
    func viewDidLayoutSubviews() {
        tableView.frame = self.bounds
            
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = post.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
    
//    private func configConstraints() {
//        
//    }
}
