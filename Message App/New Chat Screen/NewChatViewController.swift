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
    
    let newChatScreen = NewChatView()
    
    override func loadView() {
        view = newChatScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Add a New Contact"
        
        newChatScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: on add button tapped....
    @objc func onAddButtonTapped(){
        let name = newChatScreen.textFieldName.text
        
        if name == "" {
            //alert..
        }else{
            let friend = User(name: name!)
            saveContactToFireStore(user: user)
        }
        
    }
    
    //MARK: logic to add a contact to Firestore...
    func saveContactToFireStore(user: User){
        
    }
        
}
