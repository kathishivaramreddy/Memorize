//
//  ContentView.swift
//  Memorize
//
//  Created by Shiva on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    
    let themes = ["Vehicle", "Animals", "Food"]
    let themeImages = ["Vehicle" : "car", "Animals" : "cat", "Food" : "carrot"]
    let themeEmojis = ["Vehicle" : ["🚗", "🚕", "🚜", "🚝"],
                       "Animals" : ["🦖", "🐙", "🐥", "🐻", "🐣", "🦅", "🐌", "🦋", "🐗", "🙉", "🐽", "🪿", "🦉", "🐜", "🐏"],
                       "Food" : ["🍏", "🍎", "🍐", "🍋"]]
    
    @State private var emojisArray = [String]()
    
    var body: some View {
        
        NavigationStack {
            TabView {
                ForEach(themes, id: \.self) { theme in
                    VStack {
                        ScrollView {
                            cards(emojis: emojisArray)
                        }
                    }
                    .tabItem {
                        Label(
                            title: { Text(theme) },
                            icon: { Image(systemName: themeImages[theme] ?? "car") }
                        )
                    }
                    .onAppear {
                        setUpThemeCards(theme: theme)
                    }
                }
            }
            .navigationTitle("Memorize!")
        }
    }
    
    func setUpThemeCards(theme: String) {
        let themeEmojis = self.themeEmojis[theme] ?? []
        
        // Ensure there are at least 4 pairs
        let pairsCount = max(4, themeEmojis.count / 2)
        var emojis: [String] = []
        
        // Add pairs of emojis
        for i in 0..<pairsCount {
            emojis.append(themeEmojis[i % themeEmojis.count])
            emojis.append(themeEmojis[i % themeEmojis.count])
        }
        
        // Shuffle the emojis for randomness
        emojis.shuffle()
        emojisArray = emojis
    }
    
    func cards(emojis: [String]) -> some View {
        return HStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                ForEach(emojis, id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio( 2/3, contentMode: .fit)
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    
    let content: String
    @State private var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
