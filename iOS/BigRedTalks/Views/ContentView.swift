//
//  ContentView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if (42.434270 < location.latitude && 42.459245 > location.latitude && -76.496569 < location.longitude && -76.469553 > location.longitude) {
                    // insert sign in screen here and then look for user to get to edit profile and messaging
                    Text("Location is within Cornell \(location.latitude), \(location.latitude)")
                        .padding()
                            } else {
                    OutOfBoundsView()
                }
            } else {            
                WelcomeView()
                    .environmentObject(locationManager)
            }
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
