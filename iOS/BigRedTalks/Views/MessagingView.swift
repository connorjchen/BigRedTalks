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
    private let user = GIDSignIn.sharedInstance().currentUser
    @State private var viewProfile = false
    @Binding var username: String
    @Binding var color : Color
//    @Binding var email: String
   
    var body: some View {
        if viewProfile {
            EditProfile(username: $username, color: $color)
        } else {
            ScrollView{
                Button {
                    self.viewProfile.toggle()
                } label: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .trailing)
                }
                .position(x: 350, y: 10)
            }
        }
//        let emailAddress = user?.profile.email
//        let fullName = user?.profile.name
//        let givenName = user?.profile.givenName
//        let familyName = user?.profile.familyName
//
//        Text("\(emailAddress ?? "|") \(fullName ?? "|") \(givenName ?? "|") \(familyName ?? "|")")
        
//        Button("Log out") {
//            authModel.signOut()
//        }
//        .buttonStyle(AuthenticationButtonStyle())
    }
}

struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView(username: .constant("HarrisonChin"), color: .constant(.red)).environmentObject(AuthenticationViewModel())
    }
}
