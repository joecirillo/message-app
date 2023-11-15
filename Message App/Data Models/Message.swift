//
//  Message.swift
//  Message App
//
//  Created by Christopher on 11/12/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Message: Codable {
    @DocumentID var id: String?
    var isSender: Bool
    var dateTime: Date
    var text: String
    
    init(isSender: Bool, dateTime: Date, text: String) {
        self.isSender = isSender
        self.dateTime = dateTime
        self.text = text
    }
}
