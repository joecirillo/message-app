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
        let db = Firestore.firestore()
        let chatRef = db.collection("users").document(currentUser).collection("chats").document(userChatting)

        let messageData: [String: Any] = [
            "message": message,
        ]

        chatRef.setData(messageData) { error in
            if let error = error {
                print("Error adding document for user: \(error.localizedDescription)")
            } else {
                print("Document added for user with UID: \(message)")
            }
        }
        
        let chatRefUserChatting = db.collection("users").document(userChatting).collection("chats").document(currentUser)

        let messageDataUserChatting: [String: Any] = [
            "message": message,
        ]

        chatRef.setData(messageDataUserChatting) { error in
            if let error = error {
                print("Error adding document for user: \(error.localizedDescription)")
            } else {
                print("Document added for user with UID: \(message)")
            }
        }
    }
}
