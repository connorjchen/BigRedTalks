//
//  BigRedTalksApp.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct BigRedTalksApp: App {
    
    @StateObject var locationManager = LocationManager()
    @StateObject var authModel = AuthenticationViewModel()

    init() {
        setupAuthentication()
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
                .environmentObject(authModel)
        }
    }
}        

extension BigRedTalksApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
    GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
  }
}
