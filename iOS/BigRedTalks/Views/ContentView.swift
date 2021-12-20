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
                Text("Location received \(location.latitude), \(location.latitude)")
                    .padding()
//            } else if locationManager.isLoading {
//                    LoadingView()
            } else {
                LoginView()
                    .environmentObject(locationManager)
            }
        }
        .background(Color(hue: 1.0, saturation: 1.0, brightness: 0.46))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
