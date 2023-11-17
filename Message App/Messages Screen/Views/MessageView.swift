//
//  MainScreenView.swift
//  Message App
//
//  Created by Joe Cirillo on 11/8/23.
//

import UIKit

class MessageView: UIView {
    var tableViewMessages: UITableView!
    var messageTextField: UITextField!
    var sendButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupTableViewMessages()
        setupMessageTextField()
        setupSendButton()

        initConstraints()
    }
    
    func setupTableViewMessages(){
        tableViewMessages = UITableView()
        tableViewMessages.register(MessageTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMessagesID)
        tableViewMessages.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewMessages)
    }
    
    func setupMessageTextField(){
        messageTextField = UITextField()
        messageTextField.placeholder = "Type in message..."
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.borderStyle = .roundedRect
        messageTextField.layer.borderColor = UIColor.gray.cgColor
        messageTextField.layer.cornerRadius = 10.0
        messageTextField.layer.borderWidth = 1.0
        self.addSubview(messageTextField)
    }
    
    func setupSendButton(){
        sendButton = UIButton(type: .system)
        sendButton.setTitle("", for: .normal)
        sendButton.setImage(UIImage(systemName: "paperplane.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
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
            tableViewMessages.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewMessages.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -72),
            tableViewMessages.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewMessages.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            messageTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            messageTextField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            messageTextField.topAnchor.constraint(equalTo: tableViewMessages.bottomAnchor, constant: 10),
            messageTextField.heightAnchor.constraint(equalToConstant: 40),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
                        
            sendButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            sendButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            sendButton.topAnchor.constraint(equalTo: tableViewMessages.bottomAnchor, constant: -10),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
                                 
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
