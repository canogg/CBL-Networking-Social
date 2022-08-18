//
//  CreateUser.swift
//  CBL Networking Social
//
//  Created by Ana Caroline Sampaio Nogueira on 09/08/22.
//

import UIKit

protocol sendUserDelegate {
    func registerUser(loginTextField: String, emailTextField: String, passwordTextField: String)
}

class CreateUserView: UIView {
    
    var delegate: sendUserDelegate? = nil
    
    var email = ""
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
        label.text = "Novo Usuário"
        return label
    }()

    lazy var loginTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = UIColor.white
        txt.autocorrectionType = .no
        txt.borderStyle = .roundedRect
        txt.keyboardType = .alphabet
        txt.attributedPlaceholder = NSAttributedString(
            string: "Nome",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.4)]
            
        )
        
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 9
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        
        return txt
    }()
    
    lazy var emailTextField: UITextField = {
        
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = UIColor.white
        txt.autocorrectionType = .no
        txt.borderStyle = .roundedRect
        txt.keyboardType = .emailAddress
        txt.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.4)]
            
        )
        
        txt.textColor = .black
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 9
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.white.cgColor
        email = txt.text ?? ""
        print(email)
        return txt
    }()


    lazy var passwordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = UIColor.white
        txt.autocorrectionType = .no
        txt.borderStyle = .roundedRect
        txt.keyboardType = .alphabet
        txt.attributedPlaceholder = NSAttributedString(
            string: "Senha",
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
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
  
    
    @objc func buttonAction(sender: UIButton!){
        self.delegate?.registerUser(loginTextField: loginTextField.text!, emailTextField: emailTextField.text!, passwordTextField: passwordTextField.text!)
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.subImageView)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.loginLabel)
        self.addSubview(self.loginTextField)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.createButton)
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
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.loginTextField.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 32),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginLabel.heightAnchor.constraint(equalToConstant: 39),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 40),
        
            
            self.emailTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 39),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 40),
        
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 39),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
        
            
            
            self.createButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.createButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.createButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 39),
            self.createButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func didEditTextField(textField: UITextField, emailText: UITextField, passwordText: UITextField){
        self.delegate?.registerUser(loginTextField: textField.text!, emailTextField: emailText.text!, passwordTextField: passwordText.text!)
        
    }
}


