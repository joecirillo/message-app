//
//  Message.swift
//  Message App
//
//  Created by Christopher on 11/12/23.
//

import Foundation

struct Message: Codable {
    var sender: User
    var dateTime: Date
    var text: String
    
    init(sender: User, dateTime: Date, text: String) {
        self.sender = sender
        self.dateTime = dateTime
        self.text = text
    }
}
