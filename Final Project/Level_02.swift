//
//  Level_02.swift
//  Final Project
//
//  Created by Student on 11/11/21.
//

import SwiftUI

struct Level_02: View {
    @State private var start = false
    @State private var timeRemaining = 30.0
    @State private var destroy = true
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
                                .onTapGesture(count: 2) {
                                    if start == true {
                                        withAnimation(Animation.default) {
                                            if moves[index] == "" {
                                                moves[index] = destroy ? " " : " "
                                                destroy.toggle()
                                            }
                                        }
                                    }
                                }
                        }
                    }
                })
                .padding()
                Spacer()
                    .preferredColorScheme(.dark)
                    .alert(isPresented: $gameOver, content: {
                        Alert(title: Text(winMessage), dismissButton: .destructive(Text("^-^"), action: {
                            withAnimation(Animation.default) {
                                moves = Array(repeating: "", count: 16)
                                gameOver = false
                                timeRemaining = 30.0
                            }
                        }))
                    })
                    .onChange(of: moves, perform: { value in
                        checkForWin()
                    })
                
                //Modified from Peter H and Dylan's code
                Text("Time Left:")
                    .padding()
                let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                
                if start == false {
                    Text("\(timeRemaining, specifier: "%.1f")")
                }
                else {
                    Text("\(timeRemaining, specifier: "%.1f")")
                        .onReceive(timer) { time in if self.timeRemaining > 0 {
                            self.timeRemaining -= 0.1
                        }
                        }
                }
                Spacer()
                Button("Start") {
                    start.toggle()
                }
                .padding()
                .font(.title)
                Spacer()
                HStack {
                    NavigationLink("Main Menu", destination: ContentView().navigationBarHidden(true))
                        .padding()
                    Button("Restart") {
                        moves = Array(repeating: "", count: 16)
                        gameOver = false
                        start.toggle()
                        timeRemaining = 30.0
                    }
                    .padding()
                NavigationLink("Next Level", destination: Level_03().navigationBarHidden(true))
                    .padding()
                }
            }
        }
        
    }
    private func checkForWin() {
        if timeRemaining <= 0
        {
            winMessage = "Oopsies :p"
            gameOver = true
            start.toggle()
        }
        if !(gameOver || moves.contains(""))
            {
            winMessage = "You Win! :D"
            gameOver = true
            start.toggle()
        }
    }
}

struct Level_02_Previews: PreviewProvider {
    static var previews: some View {
        Level_02()
    }
}
