//
//  MainScreenView.swift
//  Message App
//
//  Created by Joe Cirillo on 11/8/23.
//

import UIKit

class MainScreenView: UIView {
    var labelText: UILabel!
    var floatingButtonNewChat: UIButton!
    var tableViewChats: UITableView!
    // test comment
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupLabelText()
        setupFloatingButtonNewChat()
        setupTableViewChats()

//        if self.tableViewChats.numberOfSections > 0 {
//            tableViewChats.scrollToRow(//MARK: numberOfSections could be cause if there is an issue
//                at: IndexPath(row: self.tableViewChats.numberOfSections-1, section: 0),
//                at: UITableView.ScrollPosition.bottom,
//                animated: false);
//        }
        
        initConstraints()
    }

    func setupLabelText(){
        labelText = UILabel()
        labelText.font = .boldSystemFont(ofSize: 14)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelText)
    }
    
    func setupTableViewChats(){
        tableViewChats = UITableView()
        tableViewChats.register(ChatsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewChatsID)
        tableViewChats.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewChats)
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
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            labelText.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            tableViewChats.topAnchor.constraint(equalTo: labelText.topAnchor, constant: 24),
            tableViewChats.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewChats.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewChats.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),

            
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
