//
//  Intro3.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct IntroView3: View {
    
    @Binding var introNum : Int
    
    var body: some View {
        ZStack {
            
            Group {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 200, height: 200)
                    .position(x: 10, y: -40)
                
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 200, height: 200)
                        .position(x: 400, y: 200)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 100, height: 100)
                        .position(x: 400, y: 100)
                }

                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 150, height: 150)
                    .position(x: -10, y: 750)
            }
            
            VStack {
                Text("Profile")
                    .bold()
                    .font(.title)

                Text("Users have the ability to change their visible username and their bubble color")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button {
                    introNum = 4
                } label: {
                    Text("Next")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
                }
                .padding()
                
                HStack {
                    Circle()
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom), lineWidth: 4)
                        .frame(width: 11, height: 11)
                    Circle()
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom), lineWidth: 4)
                        .frame(width: 11, height: 11)
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 15, height: 15)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Intro3_Previews: PreviewProvider {
    static var previews: some View {
        IntroView3(introNum: .constant(3))
    }
}
