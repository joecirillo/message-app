//
//  Chat.swift
//  Message App
//
//  Created by Christopher on 11/11/23.
//

import Foundation

struct Chat: Codable{
    var messages: [Message]
    var userChatting: User
    
    init(messages: [Message], userChatting: User) {
        self.messages = messages
        self.userChatting = userChatting
    }
}
