//
//  ProfileModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/14/22.
//

import Foundation
import GoogleSignIn

struct TotalProfile: Codable {
    var user: UserProfile
    // isNew is never really used bc we handle it with firebase
    var isNew: Bool
}

struct UserProfile: Codable {
    var _id: String
    var username: String
    var color: String
    var banned: Bool
}
    
class ProfileViewModel: ObservableObject {
    @Published var profile: TotalProfile = TotalProfile(user: UserProfile(_id: "blank", username: "blank", color: "#009CFF", banned: false), isNew: false)
    private let baseUrl = "https://bigredtalks.herokuapp.com/"
    
    init() {
        getProfile(userEmail: (GIDSignIn.sharedInstance().currentUser)!.profile.email)
    }
    
    func getProfile (userEmail: String) {
        guard let url = URL(string: baseUrl + "user/" + userEmail) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            self.profile = try! JSONDecoder().decode(TotalProfile.self, from: data!)
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
