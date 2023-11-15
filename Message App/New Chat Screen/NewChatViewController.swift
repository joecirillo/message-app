//
//  NewChatViewController.swift
//  Message App
//
//  Created by Christopher on 11/12/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class NewChatViewController: UIViewController {
    var currentUser:FirebaseAuth.User?
    let database = Firestore.firestore()
    let childProgressView = ProgressSpinnerViewController()
    let newChatScreen = NewChatView()
    
    override func loadView() {
        view = newChatScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Start a new Chat"
        
        newChatScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: on add button tapped....
    @objc func onAddButtonTapped(){
        if let email = newChatScreen.textFieldEmail.text?.lowercased(){
            
            if email == "" {
                //alert..
                showUserNotEnteredAlert()
            }
            else{
                // checks the users collection in Firestore to determine whether the email is a valid user
                checkDocumentExists(email: email)
                
                //MARK: need to get user from given email and set that as userChatting in new Chat
                //let friend = getFriendFromFirebase()
                //let chat = Chat(messages: [Message](), userChatting: friend)
                //saveChatToFireStore(chat: chat)
            }
        }
        
    }
    
    func checkDocumentExists(email documentID: String) {
        let db = Firestore.firestore()
        let documentRef = db.collection("users").document(documentID)

        documentRef.getDocument { (documentSnapshot, error) in
            if let error = error {
                print("Error getting document: \(error.localizedDescription)")
                return
            }

            if let documentSnapshot = documentSnapshot, documentSnapshot.exists {
                print("The document with ID \(documentID) exists.")
                var chat = Chat(userChatting: documentID)
                chat.id = "chatting \(chat.userChatting)"
                self.createChatInFireStore(chat: chat)
            } else {
                print("The document with ID \(documentID) does not exist.")
                self.showUserDoesNotExistAlert()
                
            }
        }
    }
    
    func createChatInFireStore(chat: Chat){
        
        if let userEmail = currentUser!.email{
            let collectionChats = database
                .collection("users")
                .document(userEmail)
                .collection("chats")
                .document("chatting_\(chat.userChatting)")
            showActivityIndicator()
            do{
                try collectionChats.setData(from: chat, completion: {(error) in
                    if error == nil{
                        self.navigationController?.popViewController(animated: true)
                        self.hideActivityIndicator()
                        print("success")
                        print(userEmail)
                    }
                })
            }catch{
                print("Error adding document!")
            }
            
            
            let otherCollectionChats = database
                .collection("users")
                .document(chat.userChatting)
                .collection("chats")
                .document("chatting_\(userEmail)")
            showActivityIndicator()
            do{
                var otherChat = Chat(userChatting: userEmail)
               // otherChat.id = "chatting \(userEmail)"
                try otherCollectionChats.setData(from: otherChat, completion: {(error) in
                    if error == nil{
                        self.navigationController?.popViewController(animated: true)
                        self.hideActivityIndicator()
                        print("success with other chat")
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }

    }
    
    //MARK: logic to add a contact to Firestore...
    func saveChatToFireStore(chat: Chat){
        
        // create a new chat here
        
        
        if let userEmail = currentUser!.email{
            let collectionChats = database
                .collection("users")
                .document(userEmail)
                .collection("chats")
            showActivityIndicator()
            do{
                try collectionChats.addDocument(from: chat, completion: {(error) in
                    if error == nil{
                        self.navigationController?.popViewController(animated: true)
                        self.hideActivityIndicator()
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }
    }
}

extension NewChatViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
