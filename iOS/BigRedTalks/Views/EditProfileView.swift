//
//  EditProfile.swift
//  BigRedTalks
//
//  Created by Harrison Chin on 1/6/22.
//

import SwiftUI

struct EditProfile: View {
    @Binding var username: String
    @Binding var color : Color
    //    @Binding var email: String
    @State private var doneEditing = false
    @EnvironmentObject var authModel: AuthenticationViewModel
    
    var body: some View {
        if doneEditing {
            HomeView(username: username)
        }
        else {
            
            VStack {
                Spacer()
                
                Text("Edit your profile")
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                    .font(.system(size: 40))
                Text("")
                    .padding(.bottom, 10.0)
                VStack(alignment: .leading, spacing: 5){
                    Text("Change your nickname:")
                        .font(.system(size: 18))
                        .fontWeight(.light)
                        .padding(.leading, 1)
                    
                    TextField("Ex: Touchdown", text: $username)
                        .frame(width: 280, height: 25)
                        .font(Font.system(size: 16))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color(hue: 0.542, saturation: 0.152, brightness: 0.975)))
                        .foregroundColor(Color(hue: 0.639, saturation: 0.706, brightness: 0.605))
                        .padding(.bottom, 30)
                }
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Choose your bubble color:")
                        .font(.system(size: 18))
                        .fontWeight(.light)
                        .padding([.leading], 20)
                    
                    
                    VStack {
                        HStack {
                            Group {
                                Spacer()
                                Button(action: {
                                    color = .red
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = .blue
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = .green
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.green)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = .yellow
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.yellow)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = .purple
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.purple)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            }
                            
                            Group{
                                Spacer()
                                Button(action: {
                                    color = .cyan
                                }) {
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.cyan)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = .black
                                }) {
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.black)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                            }
                        }
                        .frame(width: 315)
                        .padding(.vertical, 10.0)
                        
                        HStack {
                            Group {
                                Spacer()
                                Button(action: {
                                    color = .red
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.934, saturation: 0.553, brightness: 0.934))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color(hue: 0.934, saturation: 0.845, brightness: 0.852)
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.934, saturation: 0.845, brightness: 0.852))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color(hue: 0.865, saturation: 0.571, brightness: 0.616)
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.865, saturation: 0.571, brightness: 0.616))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color(hue: 0.405, saturation: 1.0, brightness: 0.615)
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.405, saturation: 1.0, brightness: 0.615))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color(hue: 0.121, saturation: 0.357, brightness: 0.73)
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.121, saturation: 0.357, brightness: 0.73))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            }
                            
                            Group{
                                Spacer()
                                Button(action: {
                                    color = Color(hue: 0.843, saturation: 0.404, brightness: 0.974)
                                }) {
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.843, saturation: 0.404, brightness: 0.974))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color(hue: 0.769, saturation: 0.391, brightness: 1.0)
                                }) {
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.769, saturation: 0.391, brightness: 1.0))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                            }
                        }
                        .frame(width: 315)
                        .padding(.bottom, 10.0)
                        
                        HStack {
                            Group {
                                Spacer()
                                Button(action: {
                                    color = .indigo
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.indigo)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color(hue: 0.542, saturation: 0.619, brightness: 0.442)
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.542, saturation: 0.619, brightness: 0.442))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = .teal
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.teal)
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color.init(hue: 190, saturation: 30, brightness: 30)
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.init(hue: 190, saturation: 30, brightness: 30))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color.init(red: 60, green: 60, blue: 0)
                                }){
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.init(red: 60, green: 60, blue: 0))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            }
                            
                            Group{
                                Spacer()
                                Button(action: {
                                    color = Color.init(red: 0, green: 160, blue: 0)
                                }) {
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color.init(red: 0, green: 160, blue: 0))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                                Spacer()
                                
                                Button(action: {
                                    color = Color(hue: 0.542, saturation: 0.574, brightness: 0.976)
                                }) {
                                    Text("")
                                        .frame(width: 28, height: 30)
                                        .background(Color(hue: 0.542, saturation: 0.574, brightness: 0.976))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
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
                
                Button {
                    self.doneEditing.toggle()
                } label: {
                    Text("Save and exit")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
                }
                .padding(.bottom, 15)
                
                Button {
                    authModel.signOut()
                } label: {
                    Text("Sign out")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
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
        EditProfile(username: .constant("HarrisonChin"), color: .constant(.red))
    }
}
