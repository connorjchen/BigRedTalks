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
    @ObservedObject var messsagesView = MessagesViewModel()
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
            NavigationView {
                ScrollViewReader { scrollView in
                    ScrollView {
                        VStack{
                            Button("Scroll to bottom") {
                                withAnimation {
                                    scrollView.scrollTo(99, anchor: .center)
                                }
                            }
                            HStack {
                                TextField("Message...", text: $message)
                                    .frame(width: 300, height: 50)
                                    .font(Font.system(size: 16))
                                    .foregroundColor(.black)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Button(action: {
                                    messsagesView.sendMessage(messageContent: message, docId: "")
                                }, label: {
                                    Image(systemName: "arrow.up.circle.fill")
                                })
                            }
                        }
                        .navigationBarColor(backgroundColor: .gray, titleColor: .white)
                        .navigationBarTitle("Big Red Talks")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                HStack {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                            }
                        }
                        
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
        MessagingView(username: .constant("HarrisonChin"), color: .constant(.red), introNum: .constant(4), message: "Hello all").environmentObject(AuthenticationViewModel())
    }
}
