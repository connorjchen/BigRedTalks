//
//  LoginView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authModel: AuthenticationViewModel
    private let purple = Color(hue: 0.63, saturation: 1.0, brightness: 1.0)
    private let blue = Color(hue: 0.584, saturation: 1.0, brightness: 1.0)
    private let lightBlue = Color(hue: 0.508, saturation: 0.5, brightness: 1.0)
    
    var body: some View {
        ZStack {
            
            Group {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [purple, blue, lightBlue]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 200, height: 200)
                    .position(x: 10, y: -40)
                
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [purple, blue, lightBlue]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 200, height: 200)
                        .position(x: 400, y: 200)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [purple, blue, lightBlue]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 100, height: 100)
                        .position(x: 400, y: 100)
                }

                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [purple, blue, lightBlue]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 150, height: 150)
                    .position(x: -10, y: 750)
            }
            
            VStack {
                Spacer()

                Spacer()

                LinearGradient(gradient: Gradient(colors: [purple, blue, lightBlue]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 300, height: 300, alignment: .center)
                    .mask(
                        Text("Big Red\nTalks")
                            .font(.system(size: 80))
                    )

                Button {
                    authModel.signIn()
                } label: {
                    Text("Sign in with Google")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [purple, blue, lightBlue]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
                }


                Spacer()
            }
        }
//        .background(Color(hue: 0.668, saturation: 1.0, brightness: 1.0))
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView().environmentObject(AuthenticationViewModel())
            //.previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
}
