//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Jainam Shah  on 11/5/20.
//

import SwiftUI

struct ContentView: View {
    
    let weatherDays : Array<Day> = [Day(dayofWeek: "TUE", image: "cloud.sun.fill", temp: 76),
                                    Day(dayofWeek: "WED", image: "sun.max.fill", temp: 88),
                                    Day(dayofWeek: "THU", image: "wind", temp: 56),
                                    Day(dayofWeek: "FRI", image: "snow", temp: 35),
                                    Day(dayofWeek: "SAT", image: "cloud.sun.fill", temp: 70)]
    
    @State private var isNight = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill", temperature: 76)
                    
                    HStack(spacing:20) {
                        ForEach(weatherDays, id: \.id){ days in
                            
                            WeatherDayView(dayOfWeek: days.dayOfWeek, imageName: days.imageName, temperature: days.temperature)
                        }
//                        WeatherDayView(dayOfWeek: "TUE",
//                                       imageName: "cloud.sun.fill",
//                                       temperature: 76)
//                        WeatherDayView(dayOfWeek: "WED",
//                                       imageName: "sun.max.fill",
//                                       temperature: 88)
//                        WeatherDayView(dayOfWeek: "THU",
//                                       imageName: "wind",
//                                       temperature: 56)
//                        WeatherDayView(dayOfWeek: "FRI",
//                                       imageName: "snow",
//                                       temperature: 35)
//                        WeatherDayView(dayOfWeek: "SAT",
//                                       imageName: "cloud.sun.fill",
//                                       temperature: 70)
                        
                    }
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                    
                }, label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                })
                Spacer()
                
                
                }
                
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek,imageName : String
    var temperature : Int
        
    var body: some View {
        VStack(spacing:0) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design:.default))
                .foregroundColor(.white)
            Image(systemName:imageName)
                .renderingMode(.original)
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
    
    @Binding var isNight : Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.largeTitle)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct WeatherStatusView: View {
    
    var imageName : String
    var temperature : Int
    
    var body: some View {
        
        VStack(spacing:10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
