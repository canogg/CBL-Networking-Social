//
//  Login.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

class LoginView: UIView {
    
    lazy var subImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bg")
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BgLogin")
        image.layer.cornerRadius = 20
        image.clipsToBounds = true

        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Social Net"
        return label
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.subImageView)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.loginLabel)
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
            

            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 108),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 108),
            self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.loginLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 16),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
            
        
        ])
    }

}
