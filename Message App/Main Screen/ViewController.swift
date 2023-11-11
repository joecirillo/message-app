//
//  ViewController.swift
//  Message App
//
//  Created by Joe Cirillo on 11/8/23.
//

import UIKit

class ViewController: UIViewController {
    let mainScreenView = MainScreenView()
    var activeChats = [Chat]()
    
    override func loadView(){
        view = mainScreenView
        
        mainScreenView.logInButton.addTarget(self, action: #selector(onLogInButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // test
        // Do any additional setup after loading the view.
        title = "Chats"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.bringSubviewToFront(mainScreenView.floatingButtonNewChat)
    }
    @objc func onLogInButtonTapped(){
        if let user = mainScreenView.userNameTextField.text,
           let password = mainScreenView.userNameTextField.text{
            if user.isEmpty {
                showEmptyErrorAlert()
            } else if password.isEmpty {
                showEmptyErrorAlert()
            } else {
                
            }
        }
    }
    func showEmptyErrorAlert(){
        let alert = UIAlertController(title: "Error", message: "The inputs cannot be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

