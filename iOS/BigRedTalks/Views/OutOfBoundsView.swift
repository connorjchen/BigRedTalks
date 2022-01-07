//
//  OutOfBoundsView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/4/22.
//

import SwiftUI

struct OutOfBoundsView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        ZStack {
            
            Group {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 200, height: 200)
                    .position(x: 10, y: -40)
                
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 200, height: 200)
                        .position(x: 380, y: 200)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 100, height: 100)
                        .position(x: 400, y: 100)
                }

                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 150, height: 150)
                    .position(x: -10, y: 700)
            }
            
            VStack {
                Spacer()

                LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 350, height: 100, alignment: .center)
                    .mask(
                        Text("Uh oh!\nYou've left campus")
                            .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                    )
                    .padding(.bottom, 20)
                
                Text("Please return to Cornell campus to\nconnect with others")
                    .multilineTextAlignment(.center)

                Spacer()
            }
        }
    }
}

struct OutOfBoundsView_Previews: PreviewProvider {
    static var previews: some View {
        OutOfBoundsView()
    }
}
