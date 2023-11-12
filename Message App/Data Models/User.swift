//
//  User.swift
//  Message App
//
//  Created by Joe Cirillo on 11/9/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    
    init(name: String, email: String, phone: Int) {
        self.name = name
        self.email = email
    }
}
