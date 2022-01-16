//
//  MessagesViewModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/12/22.
//

import Foundation
import Firebase


struct Message: Codable, Identifiable {
    var id: String?
    var content: String
    //var senderEmail: String
    var username: String
//    var text: String
//    var timestamp: String
//    var likes: [String]
}

class MessagesViewModel: ObservableObject {
    @Published var messages = [Message]()
    private let user = Auth.auth().currentUser
    private let baseUrl = "http://bigredtalks.herokuapp.com/"

    func getMessages (messageIndex: Int) {
        guard let url = URL(string: baseUrl + "messages/" + String(messageIndex)) else { return }

        //URLSession.shared.dataTask(with: url) { (data, , ) in

    }

    func sendMessage (messageSenderEmail: String, messageUsername: String, messageText: String) {

    }

    func editLikes (messageId: String, messageSenderEmail: String) {

    }

}
