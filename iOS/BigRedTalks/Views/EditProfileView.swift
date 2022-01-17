//
//  EditProfile.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/6/22.
//

import SwiftUI

struct EditProfile: View {
    @State private var doneEditing = false
    @EnvironmentObject var authModel: AuthenticationViewModel
    @EnvironmentObject var profileModel: ProfileViewModel
    @State var username : String = ""
    @State var color : Color = .red
    
    internal var textStyle = LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
    internal var buttonStyle = LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .leading, endPoint: .trailing)
    
    func makeButton(buttonColor : Color) -> some View {
        let button =
        Button(action: {
            self.color = buttonColor
        }){
            Text("")
                .frame(width: 28, height: 30)
                .background(buttonColor)
                .clipShape(Circle())
        }
        .buttonStyle(PlainButtonStyle())
        .shadow(color: .gray, radius: 2, x: 0, y: 3)
        
        return button
    }
    
    var body: some View {
        if doneEditing {
            MessagingView()
        }
        else {
            VStack {
                Spacer()
                
                Text("Edit your profile")
                    .foregroundStyle(textStyle)
                    .font(.system(size: 40))
                Text("")
                    .padding(.bottom, 10.0)
                VStack(alignment: .leading, spacing: 5){
                    Text("Change your nickname:")
                        .font(.system(size: 18))
                        .fontWeight(.light)
                        .padding(.leading, 1)
                    
                    HStack{
                        // must limit to alphanumeric and _.,!"'/$ symbols
                        TextField("Ex: Touchdown", text: $username)
                            .frame(width: 280, height: 25)
                            .font(Font.system(size: 16))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 16).fill(Color(hue: 0.542, saturation: 0.152, brightness: 0.975)))
                            .foregroundColor(Color(hue: 0.639, saturation: 0.706, brightness: 0.605))
                            .padding(.bottom, 30)
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Choose your bubble color:")
                            .font(.system(size: 18))
                            .fontWeight(.light)
                            .padding([.leading], 20)
                        
                        makeButton(buttonColor: color)
                    }
                    
                    VStack {
                        HStack {
                            Group {
                                Spacer()
                
                                makeButton(buttonColor: .red)
                                
                                Spacer()
                                
                                makeButton(buttonColor: .blue)
                                
                                Spacer()
                                
                                makeButton(buttonColor: .green)
                                
                                Spacer()
                                
                                makeButton(buttonColor: .yellow)
                                
                                Spacer()
                                
                                makeButton(buttonColor: .purple)
                            }
                            
                            Group{
                                Spacer()
                                
                                makeButton(buttonColor: .cyan)
                                
                                Spacer()
                                
                                makeButton(buttonColor: .black)
                                
                                Spacer()
                            }
                        }
                        .frame(width: 315)
                        .padding(.vertical, 10.0)
                        
                        HStack {
                            Group {
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.934, saturation: 0.553, brightness: 0.934))
                                
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.934, saturation: 0.845, brightness: 0.852))
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.865, saturation: 0.571, brightness: 0.616))
                                
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.405, saturation: 1.0, brightness: 0.615))
                                
                                Spacer()
                                
                                
                                makeButton(buttonColor: Color(hue: 0.121, saturation: 0.357, brightness: 0.73))
                            }
                            
                            Group{
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.843, saturation: 0.404, brightness: 0.975))
                                
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.769, saturation: 0.391, brightness: 1.0))
                                
                                Spacer()
                            }
                        }
                        .frame(width: 315)
                        .padding(.bottom, 10.0)
                        
                        HStack {
                            Group {
                                Spacer()
                                
                                makeButton(buttonColor: .indigo)
                                
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.542, saturation: 0.619, brightness: 0.442))
                                
                                Spacer()
                                
                                makeButton(buttonColor: .teal)
                                
                                Spacer()
                                
                                makeButton(buttonColor: Color.init(hue: 190, saturation: 30, brightness: 30))
                                
                                Spacer()
                                
                                makeButton(buttonColor: Color.init(red: 60, green: 60, blue: 0))
                            }
                            
                            Group{
                                Spacer()
                                
                                makeButton(buttonColor: Color.init(red: 0, green: 160, blue: 0))
                                
                                Spacer()
                                
                                makeButton(buttonColor: Color(hue: 0.542, saturation: 0.574, brightness: 0.976))
                                
                                Spacer()
                            }
                        }
                        .frame(width: 315)
                        .padding(.bottom, 10.0)
                        
                    }
                    .background( RoundedRectangle(cornerRadius: 20).fill(Color(hue: 0.542, saturation: 0.152, brightness: 0.975)))
                    .frame(width: 350)
                }
                .padding(.bottom, 40)
                
                Spacer()
                
                Button {
                    //                        profileModel.editProfile(id: username, bubbleColor: color)
                    self.doneEditing.toggle()
                } label: {
                    Text("Save and exit")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(buttonStyle, lineWidth: 4))
                }
                .padding(.bottom, 15)
                
                Button {
                    authModel.signOut()
                } label: {
                    Text("Sign out")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(buttonStyle, lineWidth: 4))
                }
                Spacer()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity
            )
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(ProfileViewModel())
    }
}
