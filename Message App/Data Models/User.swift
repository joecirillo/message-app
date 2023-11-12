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
    var chats: [Chat]
    
    init(name: String, chats: [Chat]) {
        self.name = name
        self.chats = chats
    }
}
