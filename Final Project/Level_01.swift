//
//  Level_01.swift
//  Final Project
//
//  Created by Student on 11/11/21.
//

import SwiftUI

struct Level_01: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Level 1")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: -30), count: 4), spacing: 8, content: {
                    ForEach(0..<16) { index in
                        Color.white
                            .frame(width: 80, height: 40)
                    }
                })
                .padding()
                HStack {
                    Text("Score: ")
                        .padding()
                    Text("Time Left: ")
                        .padding()
                }
                Spacer()
                    .preferredColorScheme(.dark)
                NavigationLink("Next Level", destination: Level_02())
            }
        }
    }
}

struct Level_01_Previews: PreviewProvider {
    static var previews: some View {
        Level_01()
    }
}
