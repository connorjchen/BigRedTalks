//
//  Intro1.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/5/22.
//

import SwiftUI

struct IntroView1: View {
    
    @Binding var introNum : Int
    
    var body: some View {
        VStack {
            Text("What is BigRedTalks?")
                .bold().font(.title)

            Button(action: {
                introNum = 2
            }) {
                Text("Next")
                    .font(.system(size: 20, weight: .semibold))
                    .modifier(ButtonModifiers())
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Intro1_Previews: PreviewProvider {
    static var previews: some View {
        IntroView1(introNum: .constant(1))
    }
}
