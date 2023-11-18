//
//  RegisterFirebaseManager.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension MessageViewController{
    func addMessageDocumentForChat(message: String, userChatting: String, currentUser: String) {
        let notificationCenter = NotificationCenter.default

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: Date())
        
        // add message document to current user's database
        let sentMessage = Message(isSender: true, dateTime: formattedDate, text: message)
        let collectionMessages = self.database.collection("users").document(currentUser).collection("chats").document(userChatting).collection("messages")
        do{
            try collectionMessages.addDocument(from: sentMessage, completion: {(error) in
                print("Document added for user with UID: \(message)")
                //MARK: update chat tableview to show latest message details
                notificationCenter.post(
                            name: Notification.Name("messageSent"),
                            object: "",
                            userInfo: ["userChatting": userChatting,"message": sentMessage.text, "dateTime": formattedDate])
            })
        }catch{
            print("Error adding document!")
        }
        // add message document to receiver's database
        let receivedMessage = Message(isSender: false, dateTime: formattedDate, text: message)
        let collectionReceiverMessages = self.database.collection("users").document(userChatting).collection("chats").document(currentUser).collection("messages")
        do{
            try collectionReceiverMessages.addDocument(from: receivedMessage, completion: {(error) in
                print("Document added for user with UID: \(message)")
            })
        }catch{
            print("Error adding document!")
        }
    }
}
