//
//  Message.swift
//  Message App
//
//  Created by Christopher on 11/12/23.
//

import Foundation

struct Message: Codable {
    var dateTime: Date
    var text: String
    
    init(dateTime: Date, text: String) {
        self.dateTime = dateTime
        self.text = text
    }
}
