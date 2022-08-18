//
//  Posts.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

protocol PostViewDelegate: AnyObject {
    func sendPost(text: String)
}

class PostView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    var posts: [PostsModel] = []
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bg")
        return image
    }()
    
    lazy var digiteTexto: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = UIColor.white
        txt.autocorrectionType = .no
        txt.borderStyle = .roundedRect
        txt.keyboardType = .alphabet
        txt.attributedPlaceholder = NSAttributedString(
            string: "Digite seu texto",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.4)]
            
        )
        
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 9
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        
        return txt
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        
        return button
        
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        if digiteTexto.text != nil {
            delegate?.sendPost(text: digiteTexto.text!)
        }
    }
    
    weak var delegate: PostViewDelegate?
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.subImageView)
        self.addSubview(digiteTexto)
        self.addSubview(tableView)
        self.addSubview(createButton)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = post.content
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.digiteTexto.bottomAnchor, constant:10),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
//
//            self.digiteTexto.bottomAnchor.constraint(equalTo: self.tableView.topAnchor, constant: 0),
            self.digiteTexto.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.digiteTexto.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            self.digiteTexto.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
        
        ])
        
        NSLayoutConstraint.activate([
         
            self.createButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 320),
            self.createButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.createButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            
        ])
    }
}
