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
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom), lineWidth: 10)
                    .frame(width: 200, height: 200)
                    .position(x: 10, y: -40)
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 150, height: 150)
                    .position(x: -10, y: 50)
                    
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                    .position(x: 380, y: 710)
            }
            
            VStack {
                Spacer()
                    .frame(height: 140)
                
                LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 300, height: 100, alignment: .center)
                    .mask(
                        Text("Your messages,\nyour way")
                            .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                    )
                
                Image("messages")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)

                Text("Choose the color of your messages for a personalized experience")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                
                Button {
                    introNum = 4
                } label: {
                    Text("Next")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
                }
                
                Spacer()
                
                HStack {
                    Circle()
                        .fill(Color("circleGray"))
                        .frame(width: 15, height: 15)
                    Circle()
                        .fill(Color("circleGray"))
                        .frame(width: 15, height: 15)
                    Circle()
                        .fill(Color("circleBlue"))
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
