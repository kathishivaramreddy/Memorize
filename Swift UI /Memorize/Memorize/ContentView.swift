//
//  ContentView.swift
//  Memorize
//
//  Created by Shiva on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
       
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    
    @State  var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
           let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base
                     .foregroundColor(.white)
                base
                     .strokeBorder(lineWidth: 2)
                 Text("👻")
            } else {
                base
            }
           
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
    
}
