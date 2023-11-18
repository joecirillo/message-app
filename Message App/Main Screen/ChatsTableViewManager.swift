//
//  ChatTableViewManager.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeChats.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let db = Firestore.firestore()
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewChatsID, for: indexPath) as! ChatsTableViewCell
        let details = activeChats[indexPath.row]
        let messageSentNotification = Notification.Name("messageSent")
        
        let observerSent = NotificationCenter.default.addObserver(forName: messageSentNotification, object: nil, queue: nil) { notification in
            let notifDetails = notification.userInfo
            if details.userChatting == notifDetails!["userChatting"] as! String {
                self.setCellDetails(cell: cell, message: notifDetails!["message"] as! String, dateTime: notifDetails!["dateTime"] as! String)
            }
        }
        
        cell.labelFriend.text = details.userChatting
        
        //MARK: need to determine if last or first message is the most recent->
        let docRef = db.collection("users").document(currentUser!.email!).collection("chats").document(details.userChatting).collection("messages")

        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var documents = querySnapshot!.documents
                let sortedMessages = documents.sorted { (doc1, doc2) -> Bool in
                    let message1 = doc1.data()["dateTime"] as? String
                    let message2 = doc2.data()["dateTime"] as? String
                    return message1! < message2!
                }
                    
                if sortedMessages.count > 0, let uwDateTime = sortedMessages.last!.data()["dateTime"] as? String, let uwMessage = sortedMessages.last!.data()["text"] as? String{
                    print(details.userChatting)
                    self.setCellDetails(cell: cell, message: uwMessage, dateTime: uwDateTime)
                }
            }
        }
        return cell
    }
    func setCellDetails(cell: ChatsTableViewCell, message: String, dateTime: String) {
        cell.labelMessage.text = message
        cell.labelDateTime.text = dateTime
    }
}
