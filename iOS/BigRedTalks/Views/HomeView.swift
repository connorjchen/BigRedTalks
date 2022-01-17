//
//  HomeView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var authModel: AuthenticationViewModel
    @StateObject var profileModel = ProfileViewModel()
    @State var introNum = 1
    
    var body: some View {
        if let location = locationManager.location {
//            if (42.434270 < location.latitude && 42.459245 > location.latitude && -76.496569 < location.longitude && -76.469553 > location.longitude) {
        
                if authModel.isNewUser {
                    if (introNum == 1) {
                        IntroView1(introNum: $introNum)
                    } else if (introNum == 2) {
                        IntroView2(introNum: $introNum)
                    } else if (introNum == 3) {
                        IntroView3(introNum: $introNum)
                    } else if (introNum == 4) {
                        MessagingView()
                            .environmentObject(profileModel)
                    }
                } else {
                    MessagingView()
                        .environmentObject(profileModel)
                }
//            } else {
//                OutOfBoundsView()
//            }
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
