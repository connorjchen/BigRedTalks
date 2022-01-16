//
//  ProfileModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/14/22.
//

import Foundation
import SwiftUI
import Firebase

struct Profile: Codable, Identifiable {
    var id: String  //This is the username
    var bubbleColor: String //will hold the hex codes
}
    
class ProfileModel: ObservableObject {
    @Published var profiles = [Profile]()
    private let user = Auth.auth().currentUser
    private let baseUrl = "http://bigredtalks.herokuapp.com/"
    
    func editProfile(id: String, bubbleColor: String){
        
    }
}
