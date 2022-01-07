//
//  Intro2.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct IntroView2: View {
    
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
                    .frame(height: 181)
                
                HStack {
                    Image("walking")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    
                    Group {
                      Text("Share ")
                            .foregroundColor(Color("darkBlue"))
                            .font(.system(size: 20, weight: .semibold)) +
                      Text("messages\nwith others by\ntyping in the messaging bar")
                            .font(.system(size: 20))
                    }
                    .frame(width: 150, height: 150)
                }
                
                HStack {
                    Image("heart")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 110)
                    
                    Group {
                      Text("Heart ")
                            .foregroundColor(Color("darkBlue"))
                            .font(.system(size: 20, weight: .semibold)) +
                      Text("messages\nthat you like or\nsupport and see\nwhat messages\nothers like too")
                            .font(.system(size: 20))
                    }
                    .frame(width: 150, height: 150)
                }
                .padding(.bottom, 50)
                
                Button {
                    introNum = 3
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
                        .fill(Color("circleBlue"))
                        .frame(width: 15, height: 15)
                    Circle()
                        .fill(Color("circleGray"))
                        .frame(width: 15, height: 15)
                }
            }
        }
    }
}

struct Intro2_Previews: PreviewProvider {
    static var previews: some View {
        IntroView2(introNum: .constant(2))
    }
}
