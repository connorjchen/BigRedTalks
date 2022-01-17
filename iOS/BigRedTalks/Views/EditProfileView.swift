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
    @State var usernameField : String = ""
    @State var color : UIColor = .red
    
    internal var textStyle = LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
    internal var buttonStyle = LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .leading, endPoint: .trailing)
    
    func makeButton(buttonColor : UIColor) -> some View {
        let button =
        Button(action: {
            self.color = buttonColor
        }){
            Text("")
                .frame(width: 28, height: 30)
                .background(Color(buttonColor))
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
            ZStack{
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
                            TextField("Ex: Touchdown", text: $usernameField)
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
                                    
                                    makeButton(buttonColor: UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 1.0))
                                        
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.65, saturation: 1, brightness: 1, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.39, saturation: 0.39, brightness: 0.5, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.19, saturation: 0.39, brightness: 0.39, alpha: 1.0))
                                    
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
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.934, saturation: 0.553, brightness: 0.934, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.934, saturation: 0.845, brightness: 0.852, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.865, saturation: 0.8, brightness: 0.616, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.405, saturation: 1.0, brightness: 0.615, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.121, saturation: 0.357, brightness: 0.73, alpha: 1.0))
                                }
                                
                                Group{
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.843, saturation: 0.404, brightness: 0.975, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.769, saturation: 0.391, brightness: 1.0, alpha: 1.0))
                                    
                                    Spacer()
                                }
                            }
                            .frame(width: 315)
                            .padding(.bottom, 10.0)
                            
                            HStack {
                                Group {
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 1, saturation: 0.27, brightness: 0.7, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.542, saturation: 0.619, brightness: 0.442, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.81, saturation: 0.27, brightness: 0.27, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.19, saturation: 0.9, brightness: 0.65, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 1, saturation: 0.3, brightness: 1, alpha: 1.0))
                                }
                                
                                Group{
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 1, saturation: 0.5, brightness: 1, alpha: 1.0))
                                    
                                    Spacer()
                                    
                                    makeButton(buttonColor: UIColor(hue: 0.542, saturation: 0.574, brightness: 0.976, alpha: 1.0))
                                    
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
//                        profileModel.editProfile(id: username, bubbleColor: color.hexa!)
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
}

extension UIColor {
    var rgb: (red: CGFloat, green: CGFloat, blue: CGFloat)? {
            var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
            guard getRed(&r, green: &g, blue: &b, alpha: nil) else { return nil }
            return (r,g,b)
        }
    //Converts the hsb value to hex
    var hexa: String? {
        guard let (r,g,b) = rgb else { return nil }
        return "#" + UInt8(r*255).hexa + UInt8(g*255).hexa + UInt8(b*255).hexa
    }
}

extension UInt8 {
    var hexa: String {
        let value = String(self, radix: 16, uppercase: true)
        return (self < 16 ? "0": "") + value
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
