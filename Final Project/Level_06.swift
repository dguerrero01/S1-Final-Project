//
//  Level_06.swift
//  Final Project
//
//  Created by Student on 11/11/21.
//

import SwiftUI

struct Level_06: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Level 6")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: -30), count: 4), spacing: 8, content: {
                    ForEach(0..<16) { index in
                        Color.purple
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
                NavigationLink("Next Level", destination: ContentView())
            }
        }
    }
}

struct Level_06_Previews: PreviewProvider {
    static var previews: some View {
        Level_06()
    }
}
