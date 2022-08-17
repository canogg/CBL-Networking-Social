//
//  FirstView.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 17/08/22.
//

import UIKit

class FirstView: UIView {

    lazy var subImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "hi")
        return image
    }()

    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center


        return button
    }()

    lazy var createButton2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign out", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center


        return button
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.subImageView)
        self.addSubview(self.createButton)
        self.addSubview(self.createButton2)
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([

            self.subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),


            self.subImageView.topAnchor.constraint(equalTo: self.createButton.bottomAnchor, constant: -500),
            self.createButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.createButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.subImageView.heightAnchor.constraint(equalToConstant: 39),
            self.createButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.subImageView.topAnchor.constraint(equalTo: self.createButton2.bottomAnchor, constant: -560),
            self.createButton2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.createButton2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.subImageView.heightAnchor.constraint(equalToConstant: 39),
            self.createButton2.heightAnchor.constraint(equalToConstant: 40),


        ]) }
}
