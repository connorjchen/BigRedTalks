//
//  ProfileView.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/6/22.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @EnvironmentObject var authModel: AuthenticationViewModel
    @State private var editProfile = false
    @State private var home = false
    @Binding var username : String
    @Binding var email : String
    @Binding var color : Color
    @Binding var introNum : Int
    
    var body: some View {
        if editProfile {
            EditProfile(username: $username, color: $color, introNum: $introNum)
        } else if home {
            HomeView()
        } else{
            ZStack {
                Group {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 200, height: 400)
                        .position(x: 10, y: -40)
                    
                    ZStack {
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 200, height: 150)
                            .position(x: 400, y: 300)
                        
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 100, height: 100)
                            .position(x: 400, y: 250)
                    }
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 150, height: 150)
                        .position(x: -10, y: 750)
                }
                
                VStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    Spacer()
                    
                    VStack (alignment: .leading) {
                        HStack{
                            Text("Username:")
                                .font(.system(size: 24))
                                .bold()
                                .padding([.top, .leading, .bottom])
                            Text(username)
                                .font(.system(size: 24))
                        }
                        
                        Spacer()
                        
                        HStack{
                            Text("Email:")
                                .font(.system(size: 24))
                                .bold()
                                .padding([.top, .leading, .bottom])
                            Text(email)
                                .font(.system(size: 24))
                        }
                        
                        Spacer()
                        
                        Button("Back to home"){
                            self.home.toggle()
                        }
                        .buttonStyle(AuthenticationButtonStyle())
                        
                        Button("Edit profile"){
                            self.editProfile.toggle()
                        }
                        .buttonStyle(AuthenticationButtonStyle())
                        
                        
                        Button("Log out") {
                            authModel.signOut()
                        }
                        .buttonStyle(AuthenticationButtonStyle())
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(username: .constant("HarryChin"), email: .constant("hc@gmail.com"), color: .constant(.red), introNum: .constant(4)).environmentObject(AuthenticationViewModel())
    }
}

