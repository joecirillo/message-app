//
//  ViewController.swift
//  Message App
//
//  Created by Joe Cirillo on 11/8/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    let mainScreen = MainScreenView()
    var activeChats = [Chat]()
    let database = Firestore.firestore()
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    let childProgressView = ProgressSpinnerViewController()

    override func loadView(){
        view = mainScreen

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.mainScreen.labelText.text = "Please sign in to see the chats!"
                self.mainScreen.floatingButtonNewChat.isEnabled = false
                self.mainScreen.floatingButtonNewChat.isHidden = true
                
                //MARK: Reset tableView...
                self.activeChats.removeAll()
                self.mainScreen.tableViewChats.reloadData()
                self.setupRightBarButton(isLoggedin: false)
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!"
                self.mainScreen.floatingButtonNewChat.isEnabled = true
                self.mainScreen.floatingButtonNewChat.isHidden = false
                self.setupRightBarButton(isLoggedin: true)
                
                self.database.collection("users")
                    .document((self.currentUser?.email?.lowercased())!)
                    .collection("chats")
                .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                    if let documents = querySnapshot?.documents{
                        self.activeChats.removeAll()
                        for document in documents{
                            do{
                                let chat = try document.data(as: Chat.self)
                                self.activeChats.append(chat)
                            }catch{
                                print(error)
                            }
                            print(self.activeChats)
                            print(self.activeChats.count)
                        }
                 //       self.activeChats.sort(by: {$0.userChatting.name < $1.userChatting.name})
                        self.mainScreen.tableViewChats.reloadData()
                    }
                })
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let details = self.activeChats[indexPath.row]
        let messageViewController = MessageViewController()
        messageViewController.userChatting = details.userChatting
        messageViewController.currentUser = currentUser?.email
        
        navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // test
        // Do any additional setup after loading the view.
        title = "Chats"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: patching table view delegate and data source...
        mainScreen.tableViewChats.delegate = self
        mainScreen.tableViewChats.dataSource = self
        
        //MARK: removing the separator line...
        mainScreen.tableViewChats.separatorStyle = .none
        
        mainScreen.floatingButtonNewChat.addTarget(self, action: #selector(newChatButtonTapped), for: .touchUpInside)
        //MARK: print(mainScreen.tableViewChats.numberOfSections)
        view.bringSubviewToFront(mainScreen.floatingButtonNewChat)
    }
    @objc func newChatButtonTapped(){
        let newChatController = NewChatViewController()
        newChatController.currentUser = self.currentUser
        navigationController?.pushViewController(newChatController, animated: true)
    }
    
    func showEmptyErrorAlert(){
        let alert = UIAlertController(title: "Error", message: "The inputs cannot be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
}

