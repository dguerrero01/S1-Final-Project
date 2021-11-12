//
//  LevelSelect.swift
//  Final Project
//
//  Created by Student on 11/10/21.
//

import SwiftUI

struct LevelSelect: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Select Level")
                    .font(.system(size: 40))
                    .font(.title)
                    .fontWeight(.bold)
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 20), count: 2), spacing: 20, content: {
                    NavigationLink("Level 1", destination: Level_01())
                    NavigationLink("Level 2", destination: Level_02())
                    NavigationLink("Level 3", destination: Level_03())
                    NavigationLink("Level 4", destination: Level_04())
                    NavigationLink("Level 5", destination: Level_05())
                    NavigationLink("Level 6", destination: Level_06())
                })
                .padding()
                Spacer()
                .preferredColorScheme(.dark)
            }
        }
    }
}

struct LevelSelect_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelect()
    }
}
