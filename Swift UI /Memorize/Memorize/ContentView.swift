//
//  ContentView.swift
//  Memorize
//
//  Created by Shiva on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🦖","🐙","🐥","🐻"]
    
    var body: some View {
        
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
       
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
            if isFaceUp {
                base
                     .foregroundColor(.white)
                base
                     .strokeBorder(lineWidth: 2)
                 Text(content)
            } else {
                base
            }
           
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
    
}
