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
    @StateObject var profileModel = ProfileViewModel()
    @State private var viewProfile = false
    @State var messageField : String = ""
    @FocusState private var messageIsFocused: Bool
    @State var proxyAlert: Bool = false
    
    var body: some View {
        if viewProfile {
            EditProfile()
                .environmentObject(profileModel)
        } else {
            NavigationView {
                VStack {
                    ScrollView {
                        ScrollViewReader { scrollViewProxy in
                            VStack {
                                ForEach(messagesModel.messages.reversed(), id: \._id) { message in
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
                                
                                Spacer()
                                    .id("EMPTY")
                            }
                            .onChange(of: proxyAlert) { _ in
                                withAnimation(.easeOut(duration: 0.5)) {
                                    scrollViewProxy.scrollTo("EMPTY", anchor: .bottom)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        TextField("Message", text: $messageField)
                            .frame(width: 300, height: 50)
                            .font(Font.system(size: 16))
                            .foregroundColor(.black)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .focused($messageIsFocused)
                        
                        Button(action: {
                            messagesModel.sendMessage(messageSenderEmail: profileModel.profile.user._id, messageUsername: profileModel.profile.user.username, messageText: self.messageField)
                            messageIsFocused = false
                            self.messageField = ""
                        }, label: {
                            Image(systemName: "arrow.up.circle.fill")
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.init(UIColor(hex: profileModel.profile.user.color) ?? UIColor.gray))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarColor(backgroundColor: UIColor(hex: profileModel.profile.user.color), titleColor: .white)
                .navigationBarTitle("Big Red Talks")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            messagesModel.getMessages(messageIndex: 0)
                            proxyAlert.toggle()
                        }, label: {
                            Image(systemName: "arrow.clockwise")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                        })
                    }
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
