//
//  Chat.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import Foundation

struct Chat: Codable{
    var messages: [String]
    var users: [User]
    
    init(messages: [String], users: [User]) {
        self.messages = messages
        self.users = users
    }
}
