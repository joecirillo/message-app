//
//  NewChatViewController.swift
//  Message App
//
//  Created by Joe Cirillo on 11/9/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageViewController: UIViewController {
    let messageScreen = MessageView()
    let messages = [Message]()
    var userChatting:String?
    var currentUser:String?
    
    override func loadView() {
        view = messageScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = userChatting
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        messageScreen.sendButton.addTarget(self, action: #selector(onSendButtonTapped), for: .touchUpInside)
        //MARK: print(mainScreen.tableViewChats.numberOfSections)
    }
    
// Controller for the user's specific chat with someone
    //MARK: on add button tapped....
    @objc func onSendButtonTapped(){
        if let message = messageScreen.messageTextField.text{
            if message == "" {
                //alert..
                showMessageNotEnteredAlert()
            } else {
                self.addMessageDocumentForChat(message: message, userChatting: self.userChatting!, currentUser: self.currentUser!)
            }
        }
        
    }
    
    func showMessageNotEnteredAlert(){
        let alert = UIAlertController(title: "Error!", message: "User not entered. Please enter a valid user.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
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

