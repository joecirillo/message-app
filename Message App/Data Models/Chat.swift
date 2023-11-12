//
//  Chat.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import Foundation

struct Chat: Codable{
    var messages: [String]
    var user: User
    
    init(messages: [String], user: User) {
        self.messages = messages
        self.user = user
    }
}
