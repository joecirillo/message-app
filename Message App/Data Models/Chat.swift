//
//  Chat.swift
//  Message App
//
//  Created by Joe Cirillo on 11/14/23.
//

import Foundation
import FirebaseFirestoreSwift


struct Chat: Codable{
    @DocumentID var id: String?
    var userChatting: String
    
    init(userChatting: String) {
        self.userChatting = userChatting
    }
}
