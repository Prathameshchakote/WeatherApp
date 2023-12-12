//  ContentView.swift
//  WeatherApp
//
//  Created by Prathamesh on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack{
                CityTextView(cityName: "Portland, OR")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 70)
                
                HStack(spacing:28){
                    WeatherDayView(dayName: "Mon", imaheName: "sun.min.fill", temperature: 74)
                    WeatherDayView(dayName: "tue", imaheName: "sun.max.fill", temperature: 68)
                    WeatherDayView(dayName: "wed", imaheName: "cloud.sun.fill", temperature: 75)
                    WeatherDayView(dayName: "thu", imaheName: "sun.dust.fill", temperature: 58)
                    WeatherDayView(dayName: "fri", imaheName: "sun.rain.fill", temperature: 64)
                }
               
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    let dayName :String
    let imaheName :String
    let temperature:Int
    
    
    var body: some View {
        VStack(spacing: 6){
            Text(dayName)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
            Image(systemName:imaheName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight:Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue,
                                                   isNight ? .gray : Color("LightBlueColor")]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    let cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView:View {
    let imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 6){
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    let title: String
    let backgroundColor: Color
    let textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 28, weight: .medium, design: .default))
            .cornerRadius(12.0)
    }
}
