//
//  Level_01.swift
//  Final Project
//
//  Created by Student on 11/11/21.
//

import SwiftUI

struct Level_01: View {
    @State private var destroy = true
    @State private var gameOver = false
    @State private var winMessage = ""
    @State private var moves = Array(repeating: "", count: 16)
    var body: some View {
        NavigationView {
            VStack {
                Text("Level 1")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(100), spacing: -15), count: 4), spacing: 8, content: {
                    ForEach(0..<16) { index in
                        ZStack {
                            Color.black
                            Color.white
                                .opacity(moves[index] == "" ? 1 : 0)
                                .frame(width: 70, height: 40)
                                .onTapGesture {
                                    withAnimation(Animation.default) {
                                        if moves[index] == "" {
                                            moves[index] = destroy ? "1" : "1"
                                            destroy.toggle()
                                        }
                                    }
                                    
                                }
                        }
                    }
                })
                .padding()
                HStack {
                    TimeLeft()
                }
                Spacer()
                    .preferredColorScheme(.dark)
            }
        }
    }
}

struct Level_01_Previews: PreviewProvider {
    static var previews: some View {
        Level_01()
    }
}

//Modified from Peter H and Dylan's code
struct TimeLeft: View {
    @State private var timeRemaining = 100.0
    @State private var start = false
    var body: some View {
        VStack {
            Text("Time Left:")
                .padding()
            let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
            
            if start == false {
                Text("\(timeRemaining, specifier: "%.1f")")
                    .font(.title)
            }
            else {
                Text("\(timeRemaining, specifier: "%.1f")")
                    .font(.largeTitle)
                    .onReceive(timer) { time in if self.timeRemaining > 0 {
                        self.timeRemaining -= 0.1
                    }
                    }
            }
            Button("Start/Stop") {
                start.toggle()
            }
            .font(.title)
        }
        
    }
}
