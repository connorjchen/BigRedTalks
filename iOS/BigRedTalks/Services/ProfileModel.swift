//
//  ProfileModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/14/22.
//

import Foundation

struct Profile: Codable, Identifiable {
    var id: String
    var username: String
    var color: String
    var banned: Bool
}
    
class ProfileModel: ObservableObject {
    @Published var profile: Profile = Profile(id: "blank", username: "blank", color: "#009CFF", banned: false)
    private let baseUrl = "http://bigredtalks.herokuapp.com/"
    
    func getProfile (userEmail: String) {
        guard let url = URL(string: baseUrl + userEmail) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            self.profile = try! JSONDecoder().decode(Profile.self, from: data!)
        }
        .resume()
    }
    
    func editProfile (userEmail: String, userColor: String, userUsername: String) {
        guard let url = URL(string: baseUrl + userEmail) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "username": userUsername,
            "color": userColor
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
