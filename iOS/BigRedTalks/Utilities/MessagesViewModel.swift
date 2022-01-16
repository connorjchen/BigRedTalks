//
//  MessagesViewModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/12/22.
//

import Foundation

struct Message: Codable, Identifiable {
    var id: String?
    var senderEmail: String
    var username: String
    var text: String
    var timestamp: String
    var likes: [String]
}

class MessagesViewModel: ObservableObject {
    @Published var messages = [Message]()
    private let baseUrl = "http://bigredtalks.herokuapp.com/"
    
    func getMessages (messageIndex: Int) {
        guard let url = URL(string: baseUrl + "messages/" + String(messageIndex)) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            self.messages = try! JSONDecoder().decode([Message].self, from: data!)
        }
        .resume()
    }
    
    func sendMessage (messageSenderEmail: String, messageUsername: String, messageText: String) {
        guard let url = URL(string: baseUrl + "messages/add") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "senderEmail": messageSenderEmail,
            "username": messageUsername,
            "text": messageText
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
    
    func editLikes (messageId: String, messageLikes: [String]) {
        guard let url = URL(string: baseUrl + messageId) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
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
