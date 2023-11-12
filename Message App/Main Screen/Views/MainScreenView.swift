//
//  MainScreenView.swift
//  Message App
//
//  Created by Joe Cirillo on 11/8/23.
//

import UIKit

class MainScreenView: UIView {
    var userNameTextField = UITextField()
    var passwordTextField = UITextField()
    var logInButton = UIButton()
    var signUpButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupUserName()
        setupPassword()
        setupLogInButton()
        setupSignUpButton()
        
        initConstraints()
    }
    
    
    func setupUserName(){
        userNameTextField = UITextField()
        userNameTextField.placeholder = "Name"
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.layer.borderColor = UIColor.gray.cgColor
        userNameTextField.layer.cornerRadius = 10.0
        userNameTextField.layer.borderWidth = 1.0
        self.addSubview(userNameTextField)
    }
    func setupPassword(){
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderWidth = 1.0
        self.addSubview(passwordTextField)
    }
     
    func setupLogInButton(){
        logInButton = UIButton()
        logInButton.setTitle("Log In", for: .normal)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.backgroundColor = UIColor.systemGreen
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        logInButton.layer.cornerRadius = 10.0
        self.addSubview(logInButton)
    }
    
    func setupSignUpButton(){
        signUpButton = UIButton()
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.backgroundColor = UIColor.systemGreen
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        signUpButton.layer.cornerRadius = 10.0
        self.addSubview(signUpButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            userNameTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            userNameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -16),
            userNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            passwordTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            logInButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            logInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -16),
            logInButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            logInButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            signUpButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            signUpButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            signUpButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
