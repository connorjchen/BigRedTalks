//
//  MessagesViewModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/12/22.
//

import Foundation

struct Message: Codable {
    var _id: String
    var senderEmail: String
    var username: String
    var text: String
    var timestamp: String
    var likes: [String]
}

struct PostMessage: Codable {
    var senderEmail: String
    var username: String
    var text: String
}

class MessagesViewModel: ObservableObject {
    @Published var messages : [Message] = []
    private let baseUrl = "https://bigredtalks.herokuapp.com/"
    
    init() {
        getMessages(messageIndex: 0)
    }
    
    func getMessages (messageIndex: Int) {
        guard let url = URL(string: baseUrl + "messages/" + String(messageIndex)) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let result = try! JSONDecoder().decode([Message].self, from: data!)
            
            DispatchQueue.main.async {
                self.messages = result
            }
        }
        .resume()
    }
    
    func sendMessage (messageSenderEmail: String, messageUsername: String, messageText: String) {
        guard let url = URL(string: baseUrl + "messages/add") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = [
            "senderEmail": messageSenderEmail,
            "username": messageUsername,
            "text": messageText
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(PostMessage.self, from: data)
                print(result)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func editLikes (messageId: String, messageLikes: [String]) {
        guard let url = URL(string: baseUrl + messageId) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "likes": messageLikes
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONSerialization.data(withJSONObject: data, options: .fragmentsAllowed)
                print(response)
            } catch {
                print(error)
            }
        }
        .resume()
    }

}
