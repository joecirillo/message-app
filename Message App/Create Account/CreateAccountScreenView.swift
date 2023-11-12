//
//  CreateAccountScreenView.swift
//  Message App
//
//  Created by Kai Johnson on 11/9/23.
//

import UIKit

class RegisterScreenView: UIView {
    var scrollView = UIScrollView()
    var userNameTextField = UITextField()
    var passwordTextField = UITextField()
    var passwordConfirmTextField = UITextField()
    var createAccountButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupScrollView()
        setupUserName()
        passwordConfirm()
        setupPassword()
        setupCreateAccountButton()
        
        initConstrains()
    }
    
    func setupScrollView(){
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
    }
    func setupUserName(){
        userNameTextField = UITextField()
        userNameTextField.placeholder = "Name"
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.layer.borderColor = UIColor.gray.cgColor
        userNameTextField.layer.cornerRadius = 10.0
        userNameTextField.layer.borderWidth = 1.0
        scrollView.addSubview(userNameTextField)
    }
    func setupPassword(){
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderWidth = 1.0
        scrollView.addSubview(passwordTextField)
    }
    func passwordConfirm(){
        passwordConfirmTextField = UITextField()
        passwordConfirmTextField.placeholder = "Retype Password"
        passwordConfirmTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmTextField.borderStyle = .roundedRect
        passwordConfirmTextField.layer.borderColor = UIColor.gray.cgColor
        passwordConfirmTextField.layer.cornerRadius = 10.0
        passwordConfirmTextField.layer.borderWidth = 1.0
        scrollView.addSubview(passwordConfirmTextField)
    }
    func setupCreateAccountButton(){
        createAccountButton = UIButton()
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(createAccountButton)
    }
    
    func initConstrains(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            userNameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            userNameTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            
            passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 16),
            
            passwordConfirmTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            passwordConfirmTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            
            createAccountButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: passwordConfirmTextField.bottomAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
