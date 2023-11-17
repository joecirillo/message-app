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
    var dateTime: String
    var text: String
    
    init(isSender: Bool, dateTime: String, text: String) {
        self.isSender = isSender
        self.dateTime = dateTime
        self.text = text
    }
}
