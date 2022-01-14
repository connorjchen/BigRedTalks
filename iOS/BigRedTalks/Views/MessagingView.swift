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
//    @ObservedObject var messsagesView: MessagesViewModel
    private let user = GIDSignIn.sharedInstance().currentUser
    @State private var viewProfile = false
    @Binding var username: String
    @Binding var color : Color
    @Binding var introNum : Int
    @State var message : String
    
    //Random data
    let users: [String] = ["Patrick", "Harrison", "Melissa", "Connor", "Matthew"]
    let messages: [String] = ["Hello", "hi", "what's up"]
    //    @Binding var email: String
    
    var body: some View {
        if viewProfile {
            EditProfile(username: $username, color: $color, introNum: $introNum)
        } else {
//            NavigationView {
//                VStack {
//                    Button {
//                        self.viewProfile.toggle()
//                    } label: {
//                        Image(systemName: "gearshape.fill")
//                            .resizable()
//                            .frame(width: 28, height: 28)
//                            .foregroundStyle(color)
//                    }
//                    .position(x: 350, y: -50)
//                    List {
//                        Text(messages[0])
//                        Text(messages[1])
//                        Text(messages[2])
//                    }
//                }
//                .navigationBarTitle("Big Red Talks")
//            }
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack {
                        Text("Big Red Talks")
                            .font(.title)
                            .multilineTextAlignment(.center)

                        Button {
                            self.viewProfile.toggle()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(color)
                        }
                        .position(x: 350, y: -50)

                        Divider().background(color)

                        Button("Scroll to bottom") {
                            withAnimation {
                                scrollView.scrollTo(99, anchor: .center)
                            }
                        }

                        Spacer()

                        HStack {
                            TextField("Message...", text: $message)
                                .frame(width: 300, height: 50)
                                .font(Font.system(size: 16))
                                .foregroundColor(.black)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Button(action: {
                                //Send message
//                                sendMessage(messageContent: <#T##String#>, docId: <#T##String#>)
                            }, label: {
                                Image(systemName: "arrow.up.circle.fill")
                            })
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
            MessagingView(username: .constant("HarrisonChin"), color: .constant(.red), introNum: .constant(4), message: "Hello all").environmentObject(AuthenticationViewModel())
    }
}
}
