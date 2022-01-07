//
//  LoginView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import SwiftUI
import CoreLocationUI

struct VerifyLocationView: View {
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
                    .frame(width: 300, height: 140, alignment: .center)
                    .mask(
                        Text("Please turn on\nlocation sharing")
                            .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                    )
                    .padding(.top, 101)
                    .padding(.bottom, -30)
                
                Image("location")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.vertical, -10)

                Button {
                    locationManager.checkIfLocationServicesIsEnabled()
                } label: {
                    Text("Share location")
                        .bold()
                        .frame(width: 250, height: 50)
                        .overlay(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4))
                }
                
                Text("\(locationManager.locationError) ")
                    .foregroundColor(.red)


                Spacer()
            }
        }
    }
}

struct VerifyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyLocationView().environmentObject(LocationManager())
    }
}
