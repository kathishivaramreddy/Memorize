//
//  ContentView.swift
//  Memorize
//
//  Created by Shiva on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🦖","🐙","🐥","🐻", "🐣","🦅","🐌","🦋","🐗","🙉","🐽","🪿","🦉","🐜","🐏"]
    @State private var cardCount = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            
              
            Spacer()
            
            HStack {
                cardCountAdjuster(by: -1, text: "Remove Card")
                Spacer()
                cardCountAdjuster(by: 1, text: "Add Card")
            }
            
            
            
        }
    }
    
    
    var cards: some View {
        HStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                        .aspectRatio( 2/3, contentMode: .fit)
                    
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
    
    func cardCountAdjuster(by offSet: Int, text: String) -> some View {
        Button(action: {
            cardCount += offSet
        }, label: {
            Text(text)
        })
        .frame(maxHeight: 40)
        .background(.orange)
        .cornerRadius(5)
        .disabled(cardCount + offSet < 1 || cardCount + offSet > emojis.count)
        
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    
    let content: String
    @State  var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
           
            Group {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
    
}
