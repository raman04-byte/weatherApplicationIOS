//
//  ContentView.swift
//  WeatherApplication
//
//  Created by Raman Tank on 02/10/24.
//

//                Text("Your coordinates are: \(location.latitude , specifier: "%.4f"), and \(location.longitude , specifier: "%.4f")")

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManger()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather{
                    WeatherView(weather: weather)
                }
                else {
                    LoadingView().task{
                        do{
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        }
                        catch{
                            print("Error getting the weather \(error)")
                        }
                    }
                }
            }else {
                if locationManager.isLoading{
                    LoadingView()
                }
                else {
                    WelcomeView().environmentObject(
                        locationManager
                    ).padding(.all,5)
                }
            }
            
            
        }.background(
            Color(hue: 0.656, saturation: 0.787, brightness: 0.354)
        ).preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
