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
                VStack(spacing: 20) {
                    Text("Connect with Cornellians")
                        .bold().font(.title)
                    Text("Please share your current location to verify you are by the Cornell Campus")
                        .padding()
                }
                .multilineTextAlignment(.center)
                .padding()
                
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.checkIfLocationServicesIsEnabled()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                
                Text("\(locationManager.locationError)")
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct VerifyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyLocationView().environmentObject(LocationManager())
    }
}
