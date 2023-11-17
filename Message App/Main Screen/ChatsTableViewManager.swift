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
        let notificationCenter = NotificationCenter.default

        //MARK: update chat tableview to show latest message details
//        notificationCenter.addObserver(
//                    self,
//                    selector: #selector(notificationReceivedForMessageSent(notification:)),
//                    name: Notification.Name("messageSent"),
//                                        object: nil)
        
        cell.labelFriend.text = details.userChatting
        
        //MARK: need to determine if last or first message is the most recent->
        let docRef = db.collection("users").document(currentUser!.email!).collection("chats").document(details.userChatting).collection("messages")

        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let messages = querySnapshot!.documents
                if messages.count > 0, let uwDateTime = messages.last!.data()["dateTime"] as? String, let uwMessage = messages.last!.data()["text"] as? String {
                    cell.labelDateTime.text = uwDateTime
                    cell.labelMessage.text = uwMessage
                }
                for document in querySnapshot!.documents {
                }
            }
        }
        
        return cell
    }
//    @objc func notificationReceivedForMessageSent(notification: Notification) {
//        self.mainScreen.tableViewChats.reloadData()
//    }
}
