//
//  ContentView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var authModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            switch authModel.state {
            case .signedIn: HomeView()
            case .signedOut: LoginView()
            }
        }
        .background(Color("backgroundBlue"))
        .preferredColorScheme(.light)
        
        .onAppear {
            locationManager.checkIfLocationServicesIsEnabled()
//            GIDSignIn.sharedInstance().restorePreviousSignIn()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
            .environmentObject(AuthenticationViewModel())
    }
}
