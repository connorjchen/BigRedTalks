//
//  HomeView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var authModel: AuthenticationViewModel
    
    var body: some View {
        if let location = locationManager.location {
            if (42.434270 < location.latitude && 42.459245 > location.latitude && -76.496569 < location.longitude && -76.469553 > location.longitude) {
                 make sure new user flow is in here
                MessagingView()
            } else {
                OutOfBoundsView()
            }
        } else {
            VerifyLocationView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationManager())
            .environmentObject(AuthenticationViewModel())
    }
}
