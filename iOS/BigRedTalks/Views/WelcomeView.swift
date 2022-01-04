//
//  WelcomeView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/4/22.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Big Red Talks")
                    .bold().font(.title)
                
                NavigationLink(destination: VerifyLocationView().environmentObject(locationManager)) {
                    Text("Learn more")
                        .font(.system(size: 20, weight: .semibold))
                        .modifier(ButtonModifiers())
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationViewStyle(.stack)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(LocationManager())
    }
}
