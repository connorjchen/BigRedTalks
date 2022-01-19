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
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                        .font(.system(size: 40))
                    Text("")
                        .padding(.bottom, 10.0)
                    VStack(alignment: .leading, spacing: 5){
                        Text("Change your nickname:")
                            .font(.system(size: 18))
                            .fontWeight(.light)
                            .padding(.leading, 1)
                        
                        HStack{
                            // must limit this to alphanumeric and 3-20 characters
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
                        profileModel.editProfile(userEmail: profileModel.profile.user._id, userColor: self.color.hexa!, userUsername: self.usernameField)
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
            .onAppear(perform: {
                usernameField = profileModel.profile.user.username
                color = UIColor(hex: profileModel.profile.user.color) ?? UIColor.gray
            })
        }
    }
}

extension UIColor {
    var hsb: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat)? {
            var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0
            guard getHue(&h, saturation: &s, brightness: &b, alpha: nil)
                else { return nil }
            return (h,s,b)
    }
    //Converts the hsb value to hex
    var hexa: String? {
        guard let (h,s,b) = hsb else { return nil }
        return "#" + UInt8(h*255).hexa + UInt8(s*255).hexa + UInt8(b*255).hexa
    }
    
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var hsb: UInt32 = 0

        var h: CGFloat = 0.0
        var s: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt32(&hsb) else { return nil }

        if length == 6 {
            h = CGFloat((hsb & 0xFF0000) >> 16) / 255.0
            s = CGFloat((hsb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(hsb & 0x0000FF) / 255.0

        } else if length == 8 {
            h = CGFloat((hsb & 0xFF000000) >> 24) / 255.0
            s = CGFloat((hsb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((hsb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(hsb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(hue: h, saturation: s, brightness: b, alpha: a)
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
