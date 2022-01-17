//
//  MessagingView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/4/22.
//

import SwiftUI
import GoogleSignIn

struct MessagingView: View {
    @StateObject var messagesModel = MessagesViewModel()
    @EnvironmentObject var profileModel: ProfileViewModel
    @State private var viewProfile = false
    @State var messageField : String = ""
    
    var body: some View {
        if viewProfile {
            EditProfile()
        } else {
// https://stackoverflow.com/questions/58376681/swiftui-automatically-scroll-to-bottom-in-scrollview-bottom-first for scroll bottom
            NavigationView {
                VStack {
                    ScrollView {
                        // should get messages on init but probably doesn't update ever
                        ForEach(messagesModel.messages, id: \._id) { message in
                            HStack {
                                VStack (alignment: .leading) {
                                    Text(message.username)
                                        .bold()
                                    Text(message.text)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 5)
                                }

                                Spacer()

                                Button(action: {
                                    // like message
                                }, label: {
                                    ZStack{
                                        // take fill away if user is not in the messages' liked list
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.red)
                                        Image(systemName: "heart")
                                            .foregroundColor(.black)
                                    }
                                })

                                // put liked length here
                                Text("7")
                                    .padding(.leading, -7)
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        TextField("Message", text: $messageField)
                            .frame(width: 300, height: 50)
                            .font(Font.system(size: 16))
                            .foregroundColor(.black)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            messagesModel.sendMessage(messageSenderEmail: profileModel.profile.user._id, messageUsername: profileModel.profile.user.username, messageText: self.messageField)
                            self.messageField = ""
                        }, label: {
                            Image(systemName: "arrow.up.circle.fill")
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(.gray))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarColor(backgroundColor: .gray, titleColor: .white)
                .navigationBarTitle("Big Red Talks")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.viewProfile.toggle()
                        }, label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                        })
                    }
                }
            }
        }
    }
}

struct NavigationBarModifier: ViewModifier {
    
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .gray)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
    
}

struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView()
            .environmentObject(ProfileViewModel())
    }
}
