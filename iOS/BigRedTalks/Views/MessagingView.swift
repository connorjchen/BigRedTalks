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
    @ObservedObject var messagesModel: MessagesViewModel
    private let user = GIDSignIn.sharedInstance().currentUser
    @State private var viewProfile = false
    @Binding var username: String
    @Binding var color : Color
    @Binding var introNum : Int
    @State var message : String
    
    var messages = [Message(id: "0", content: "hello my name is connor and welcome to big red talks, hope you enjoy your experience", name: "Connor"), Message(id: "1", content: "hi", name: "Patrick"), Message(id: "2", content: "im here", name: "Melissa"), Message(id: "3", content: "hello my name is connor and welcome to big red talks, hope you enjoy your experience", name: "Connor"), Message(id: "4", content: "hi", name: "Patrick"), Message(id: "5", content: "im here", name: "Melissa"), Message(id: "6", content: "hello my name is connor and welcome to big red talks, hope you enjoy your experience", name: "Connor"), Message(id: "7", content: "hi", name: "Patrick"), Message(id: "8", content: "im here", name: "Melissa"), Message(id: "9", content: "hello my name is connor and welcome to big red talks, hope you enjoy your experience", name: "Connor"), Message(id: "10", content: "hi", name: "Patrick"), Message(id: "11", content: "im here", name: "Melissa")]
    
    var body: some View {
        if viewProfile {
            EditProfile(username: $username, color: $color, introNum: $introNum)
        } else {
//        https://stackoverflow.com/questions/58376681/swiftui-automatically-scroll-to-bottom-in-scrollview-bottom-first for scroll bottom
            NavigationView {
                VStack {
                    ScrollView {
                        ForEach(messages) { message in
                            HStack {
                                VStack (alignment: .leading) {
                                    Text(message.name)
                                        .bold()
                                    Text(message.content)
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
                    
                    HStack {
                        TextField("Message...", text: $message)
                            .frame(width: 300, height: 50)
                            .font(Font.system(size: 16))
                            .foregroundColor(.black)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            //Send message
                            // sendMessage(messageContent: <#T##String#>, docId: <#T##String#>)
                        }, label: {
                            Image(systemName: "arrow.up.circle.fill")
                        })
                    }
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
        MessagingView(messagesModel: MessagesViewModel(), username: .constant("HarrisonChin"), color: .constant(.red), introNum: .constant(4), message: "Hello all")
            .environmentObject(AuthenticationViewModel())
    }
}
