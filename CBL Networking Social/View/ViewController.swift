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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // navegacao \\self.present...
    // criação das views que vao pra tela // self.view.addSubview(...)
    let viewModel: ViewModel = ViewModel()
    
    let tableView = UITableView()
    
    var posts: [PostsModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        Task {
            posts = await API.getPosts()
            tableView.reloadData()
            print(posts.count)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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
   
}

