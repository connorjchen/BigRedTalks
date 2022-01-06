//
//  Intro1.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct IntroView1: View {
    
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
                Text("What is BigRedTalks?")
                    .bold()
                    .font(.title)

                Text("BigRedTalks is a platform where Cornell students can converse with one another in one giant group chat!")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button {
                    introNum = 2
                } label: {
                    Text("Next")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
                }
                .padding()
                
                HStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 15, height: 15)
                    Circle()
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom), lineWidth: 4)
                        .frame(width: 11, height: 15)
                    Circle()
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("customPurple"), Color("customBlue"), Color("customLightBlue")]), startPoint: .top, endPoint: .bottom), lineWidth: 4)
                        .frame(width: 11, height: 11)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Intro1_Previews: PreviewProvider {
    static var previews: some View {
        IntroView1(introNum: .constant(1))
    }
}
