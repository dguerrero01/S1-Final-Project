//
//  Rules.swift
//  Final Project
//
//  Created by Student on 12/16/21.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Rules")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Text("Tap the blocks until they break! :)")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .padding()
                Spacer()
                NavigationLink("Back", destination: LevelSelect().navigationBarHidden(true))
                    .padding()
                    .preferredColorScheme(.dark)
            }
        }
    }
}

struct Rules_Previews: PreviewProvider {
    static var previews: some View {
        Rules()
    }
}
