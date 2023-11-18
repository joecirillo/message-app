//
//  RightBarButtonManager.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import UIKit
import FirebaseAuth

extension ViewController{
    func setupRightBarButton(isLoggedin: Bool){
        if isLoggedin{
            //MARK: user is logged in...
            let barIcon = UIBarButtonItem(
                image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
                style: .plain,
                target: self,
                action: #selector(onLogOutBarButtonTapped)
            )
            
            navigationItem.rightBarButtonItems = [barIcon]
            
        }else{
            //MARK: not logged in...
            let barIcon = UIBarButtonItem(
                image: UIImage(systemName: "person.fill.questionmark"),
                style: .plain,
                target: self,
                action: #selector(onSignInBarButtonTapped)
            )
            
            navigationItem.rightBarButtonItems = [barIcon]
        }
    }
    
      @objc func onSignInBarButtonTapped() {
            showSignInAlert()
        }
    
    @objc func showSignInAlert(){
        let signInAlert = UIAlertController(
            title: "Sign In / Register",
            message: "Please sign in to continue.",
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        //MARK: setting up password textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }
        
        //MARK: Sign In Action...
        let signInAction = UIAlertAction(title: "Sign In", style: .default, handler: { [weak self] (_) in
            guard let self = self else { return }

            let emailField = signInAlert.textFields![0]
            let passwordField = signInAlert.textFields![1]

            if let email = emailField.text, !email.isEmpty,
               let password = passwordField.text, !password.isEmpty {
                self.signInToFirebase(email: email, password: password)
            } else {
                let missingInfoAlert = UIAlertController(
                    title: "Missing Information",
                    message: "Both email and password are required to sign in.",
                    preferredStyle: .alert
                )
                missingInfoAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self] _ in self?.onSignInBarButtonTapped()}))
                self.present(missingInfoAlert, animated: true)
            }
        })

        
        //MARK: Register Action...
        let registerAction = UIAlertAction(title: "Register", style: .default, handler: {(_) in
            //MARK: logic to open the register screen...
            let registerViewController = RegisterViewController()
            self.navigationController?.pushViewController(registerViewController, animated: true)
        })
        
        //MARK: action buttons...
        signInAlert.addAction(signInAction)
        signInAlert.addAction(registerAction)
        
        self.present(signInAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            signInAlert.view.superview?.isUserInteractionEnabled = true
            signInAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    
    func signInToFirebase(email: String, password: String) {
            showActivityIndicator()
            Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] (result, error) in
                guard let self = self else { return }
                self.hideActivityIndicator()

                if error == nil {
                    // User authenticated...
                } else {
                    // Alert for incorrect credentials...
                    let wrongInfoAlert = UIAlertController(
                        title: "No User Found",
                        message: "No User Found or Wrong Email/Password.",
                        preferredStyle: .alert
                    )
                    wrongInfoAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
                        self?.showSignInAlert()
                    }))
                    self.present(wrongInfoAlert, animated: true)
                }
            })
        }
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
    @objc func onLogOutBarButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?",
            preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
    
}
