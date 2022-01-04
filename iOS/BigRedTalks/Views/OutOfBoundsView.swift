//
//  OutOfBoundsView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/4/22.
//

import SwiftUI

struct OutOfBoundsView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        Text("Error: Outside of Cornell Campus!")
    }
}

struct OutOfBoundsView_Previews: PreviewProvider {
    static var previews: some View {
        OutOfBoundsView()
    }
}
