//
//  NewChatViewController.swift
//  Message App
//
//  Created by Joe Cirillo on 11/9/23.
//

import UIKit

class MessageViewController: UIViewController {
    let messageScreen = MessageView()
    let messages = [Message]()
    
    override func loadView() {
        view = messageScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // title = userChatting?.name
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        messageScreen.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        //MARK: print(mainScreen.tableViewChats.numberOfSections)
    }
    @objc func sendButtonTapped(){
        
    }
    

// Controller for the user's specific chat with someone

}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMessagesID, for: indexPath) as! MessageTableViewCell
        cell.labelMessage.text = messages[indexPath.row].text
        //MARK: need to determine if last or first message is the most recent->
        cell.isSender = messages[indexPath.row].isSender
        return cell
    }
}

