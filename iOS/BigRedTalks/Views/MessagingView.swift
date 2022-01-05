//
//  MessagingView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/4/22.
//

import SwiftUI
import GoogleSignIn

struct MessagingView: View {
    @EnvironmentObject var authModel: AuthenticationViewModel
    private let user = GIDSignIn.sharedInstance().currentUser!
    
    var body: some View {
        let emailAddress = user.profile.email
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let profilePicUrl = user.profile.imageURL(withDimension: 320)
        
        Text("\(emailAddress ?? "|") \(fullName ?? "|") \(givenName ?? "|") \(familyName ?? "|")")
    }
}

struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView().environmentObject(AuthenticationViewModel())
    }
}
