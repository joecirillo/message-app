//
//  NewChatAlerts.swift
//  Message App
//
//  Created by Joe Cirillo on 11/14/23.
//

import Foundation
import UIKit

extension NewChatViewController{
    
    func showUserNotEnteredAlert(){
        let alert = UIAlertController(title: "Error!", message: "User not entered. Please enter a valid user.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func showUserDoesNotExistAlert(){
        let alert = UIAlertController(title: "Error!", message: "Invalid user. Please enter a valid user.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}
