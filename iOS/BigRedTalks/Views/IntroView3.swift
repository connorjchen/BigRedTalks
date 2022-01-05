//
//  Intro3.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct IntroView3: View {
    
    @Binding var introNum : Int
    
    var body: some View {
        VStack {
            Text("How to Customize Settings")
                .bold().font(.title)

            Button(action: {
                introNum = 4
            }) {
                Text("Next")
                    .font(.system(size: 20, weight: .semibold))
                    .modifier(ButtonModifiers())
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Intro3_Previews: PreviewProvider {
    static var previews: some View {
        IntroView3(introNum: .constant(3))
    }
}
