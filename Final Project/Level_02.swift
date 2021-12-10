//
//  Level_02.swift
//  Final Project
//
//  Created by Student on 11/11/21.
//

import SwiftUI

struct Level_02: View {
    @State private var destroy = true
    @State private var timeLeft = 0.0
    @State private var gameOver = false
    @State private var winMessage = ""
    @State private var moves = Array(repeating: "", count: 16)
    var body: some View {
        NavigationView {
            VStack {
                Text("Level 2")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(100), spacing: -15), count: 4), spacing: 8, content: {
                    ForEach(0..<16) { index in
                        ZStack {
                            Color.black
                            Color.pink
                                .opacity(moves[index] == "" ? 1 : 0)
                                .frame(width: 70, height: 40)
                                .onTapGesture(count:2) {
                                    withAnimation(Animation.default) {
                                        if moves[index] == "" {
                                            moves[index] = destroy ? " " : " "
                                            destroy.toggle()
                                        }
                                    }
                                    
                                }
                        }
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
                NavigationLink("Next Level", destination: Level_03())
            }
        }
    }
}

struct Level_02_Previews: PreviewProvider {
    static var previews: some View {
        Level_02()
    }
}
