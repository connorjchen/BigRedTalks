//
//  MessagesViewModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/12/22.
//

import Foundation
import Firebase


struct Message: Codable, Identifiable {
    var id: String
    var content: String
    var name: String
}

class MessagesViewModel: ObservableObject {
    @Published var messages = [Message]()
    private let user = Auth.auth().currentUser
    private let db = ""
    
    func sendMessage (messageContent: String, docId: String) {
        
    }
}
