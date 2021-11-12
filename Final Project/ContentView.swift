//
//  ContentView.swift
//  Final Project
//
//  Created by Student on 11/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Brick, Brick, Break!")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 8), count: 3), spacing: 10, content: {
                    ForEach(0..<9) { index in
                        Color.white
                            .frame(width: 100, height: 50)
                    }
                })
                .padding()
                NavigationLink("PLAY", destination: LevelSelect())
                    .padding()
                Spacer()
                    .preferredColorScheme(.dark)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
