//
//  ProfileModel.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/14/22.
//

import Foundation
import SwiftUI

struct Profile: Identifiable {
    var id: String  //This is the username
    var email: String?
    var bubbleColor: Color
}
    
class ProfileModel: ObservableObject {
    @Published var profiles = [Profile]()
    private let db = ""
    
    func editProfile(id: String, bubbleColor: Color){
        
    }
}
