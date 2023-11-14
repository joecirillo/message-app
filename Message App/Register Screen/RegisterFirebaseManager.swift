//
//  RegisterFirebaseManager.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension RegisterViewController{
    
    func registerNewAccount(){
        showActivityIndicator()
        //MARK: create a Firebase user with email and password...
        if let name = registerView.textFieldName.text,
           let email = registerView.textFieldEmail.text,
           let password = registerView.textFieldPassword.text,
           let confirmPassword = registerView.textFieldConfirmPassword.text,
           password == confirmPassword {
            //Validations....
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                    self.addDocumentForUser(email: email, displayName: name)
                }else{
                    //MARK: there is a error creating the user...
                    print(error)
                }
            })
        }
    }
    
    func addDocumentForUser(email: String, displayName: String) {
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(email)

        let userData: [String: Any] = [
            "name": displayName,
        ]

        userRef.setData(userData) { error in
            if let error = error {
                print("Error adding document for user: \(error.localizedDescription)")
            } else {
                print("Document added for user with UID: \(email)")
            }
        }
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                self.hideActivityIndicator()
                //MARK: the profile update is successful...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
}
