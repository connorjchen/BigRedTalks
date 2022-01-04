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
        VStack {
            VStack(spacing: 20) {
                Text("Connect with all Cornellians")
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
        .navigationBarBackButtonHidden(true)
    }
}

struct VerifyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyLocationView().environmentObject(LocationManager())
    }
}
