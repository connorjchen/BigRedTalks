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
                
                Image("phone")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 300, height: 20, alignment: .center)
                    .mask(
                        Text("Connect with all Cornellians")
                            .font(.system(size: 20, weight: .semibold))
                    )
                    .padding(.top, 20)

                Text("BigRedTalks is a platform where Cornell students, verified by location and email, can interact in one giant group chat!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                
                Button {
                    introNum = 2
                } label: {
                    Text("Next")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
                }
                
                Spacer()
                    .frame(height: 190)
                
                HStack {
                    Circle()
                        .fill(Color("circleBlue"))
                        .frame(width: 15, height: 15)
                    Circle()
                        .fill(Color("circleGray"))
                        .frame(width: 15, height: 15)
                    Circle()
                        .fill(Color("circleGray"))
                        .frame(width: 15, height: 15)
                }
            }
        }
    }
}

struct Intro1_Previews: PreviewProvider {
    static var previews: some View {
        IntroView1(introNum: .constant(1))
    }
}
