//
//  MainScreenView.swift
//  Message App
//
//  Created by Joe Cirillo on 11/8/23.
//

import UIKit

class MainScreenView: UIView {
    var scrollView: UIScrollView!
    var userNameTextField: UITextField!
    var passwordTextField: UITextField!
    var floatingButtonNewChat: UIButton!
    var tableViewChats: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupScrollView()
        setupUserName()
        setupPassword()
        setupFloatingButtonNewChat()
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
    func setupFloatingButtonNewChat(){
        floatingButtonNewChat = UIButton(type: .system)
        floatingButtonNewChat.setTitle("", for: .normal)
        floatingButtonNewChat.setImage(UIImage(systemName: "note.text.badge.plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButtonNewChat.contentHorizontalAlignment = .fill
        floatingButtonNewChat.contentVerticalAlignment = .fill
        floatingButtonNewChat.imageView?.contentMode = .scaleAspectFit
        floatingButtonNewChat.layer.cornerRadius = 16
        floatingButtonNewChat.imageView?.layer.shadowOffset = .zero
        floatingButtonNewChat.imageView?.layer.shadowRadius = 0.8
        floatingButtonNewChat.imageView?.layer.shadowOpacity = 0.7
        floatingButtonNewChat.imageView?.clipsToBounds = true
        floatingButtonNewChat.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonNewChat)
    }
    
    func initConstrains(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),

            tableViewChats.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            tableViewChats.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8),
            tableViewChats.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            tableViewChats.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),

            floatingButtonNewChat.widthAnchor.constraint(equalToConstant: 48),
            floatingButtonNewChat.heightAnchor.constraint(equalToConstant: 48),
            floatingButtonNewChat.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonNewChat.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
