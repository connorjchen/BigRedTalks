//
//  Intro2.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct IntroView2: View {
    
    @Binding var introNum : Int
    
    var body: some View {
        VStack {
            Text("How to Message")
                .bold().font(.title)

            Button(action: {
                introNum = 3
            }) {
                Text("Next")
                    .font(.system(size: 20, weight: .semibold))
                    .modifier(ButtonModifiers())
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Intro2_Previews: PreviewProvider {
    static var previews: some View {
        IntroView2(introNum: .constant(2))
    }
}
