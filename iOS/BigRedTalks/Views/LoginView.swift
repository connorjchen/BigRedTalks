//
//  LoginView.swift
//  BigRedTalks
//
//  Created by Fam Bam on 12/20/21.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Big Red Talks")
                    .bold().font(.title)
                
                //insert button to direct to google login
                //likely will need a loginManager file (can prob look up how to do google login^)
            }
            .multilineTextAlignment(.center)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
