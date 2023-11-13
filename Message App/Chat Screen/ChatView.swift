//
//  NewChatView.swift
//  Message App
//
//  Created by Joe Cirillo on 11/9/23.
//

import UIKit

class ChatView: UIView {

    // View for when the user is in a specific chat with someone

    var scrollView = UIScrollView()
    var tableView: UITableView!
    var meesageTextField: UITextField!
    var sendButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupScrollView()
        setupTableView()
        setupMessageTextField()
        setupSendButton()
        
        initConstraints()
    }
    
    func setupScrollView(){
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
    }
    
    func setupTableView(){
        tableView = UITableView()
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: Configs.tableViewChatsID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(tableView)
        }
    
    func setupMessageTextField(){
        meesageTextField = UITextField()
        meesageTextField.placeholder = "Name"
        meesageTextField.translatesAutoresizingMaskIntoConstraints = false
        meesageTextField.borderStyle = .roundedRect
        meesageTextField.layer.borderColor = UIColor.gray.cgColor
        meesageTextField.layer.cornerRadius = 10.0
        meesageTextField.layer.borderWidth = 1.0
        scrollView.addSubview(meesageTextField)
    }
    
    func setupSendButton(){
        sendButton = UIButton(type: .system)
        sendButton.setTitle("", for: .normal)
        sendButton.setImage(UIImage(systemName: "npaperplane.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        sendButton.contentHorizontalAlignment = .fill
        sendButton.contentVerticalAlignment = .fill
        sendButton.imageView?.contentMode = .scaleAspectFit
        sendButton.layer.cornerRadius = 16
        sendButton.imageView?.layer.shadowOffset = .zero
        sendButton.imageView?.layer.shadowRadius = 0.8
        sendButton.imageView?.layer.shadowOpacity = 0.7
        sendButton.imageView?.clipsToBounds = true
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sendButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
                    scrollView.rightAnchor.constraint(equalTo: rightAnchor),
                    scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            
            tableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    tableView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
                    tableView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
                    tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            meesageTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
                    meesageTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                    meesageTextField.heightAnchor.constraint(equalToConstant: 40),
                    meesageTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -10),
            
            sendButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
                    sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                    sendButton.widthAnchor.constraint(equalToConstant: 40),
                    sendButton.heightAnchor.constraint(equalToConstant: 40)
                        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

