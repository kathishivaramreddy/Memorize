//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Shiva on 8/10/24.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(10)
    }
}
