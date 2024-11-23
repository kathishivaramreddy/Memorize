//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Shiva on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight =  false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(weatherImage: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)
                
                Spacer()
                HStack(spacing: 20) {
                                    WeatherDayView(dayOfWeek: "TUE",
                                                   imageName: "cloud.sun.fill",
                                                   temperature: 74)
                                    
                                    WeatherDayView(dayOfWeek: "WED",
                                                   imageName: "sun.max.fill",
                                                   temperature: 88)
                                    
                                    WeatherDayView(dayOfWeek: "THU",
                                                   imageName: "wind.snow",
                                                   temperature: 55)
                                    
                                    WeatherDayView(dayOfWeek: "FRI",
                                                   imageName: "sunset.fill",
                                                   temperature: 60)
                                    
                                    WeatherDayView(dayOfWeek: "SAT",
                                                   imageName: "snow",
                                                   temperature: 25)
                                }
                Spacer()
                
                Button(action: {
                    
                    isNight =  isNight ? false : true
                }, label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}


struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        
        
        LinearGradient(gradient: Gradient(colors: [ isNight ?  .black : Color.blue, isNight ? .gray : Color.white]),
                       startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var weatherImage: String
    var temperature: Int
    var body: some View {
        
        VStack(spacing: 8) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium, design: .default))
                .foregroundColor(.white)
                
        }
    }
}
