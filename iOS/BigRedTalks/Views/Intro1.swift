//
//  Intro1.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct Intro1: View {
    var body: some View {
        // this view is for first time users after sign in and location process
        Text("hey")
//        NavigationView {
//            VStack {
//                Text("Big Red Talks")
//                    .bold().font(.title)
//
//                NavigationLink(destination: VerifyLocationView().environmentObject(locationManager)) {
//                    Text("Learn more")
//                        .font(.system(size: 20, weight: .semibold))
//                        .modifier(ButtonModifiers())
//                }
//
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//        .navigationViewStyle(.stack)
    }
}

struct Intro1_Previews: PreviewProvider {
    static var previews: some View {
        Intro1()
    }
}
