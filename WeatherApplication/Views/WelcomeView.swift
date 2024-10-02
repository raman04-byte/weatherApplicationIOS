//
//  WelcomeView.swift
//  WeatherApplication
//
//  Created by Raman Tank on 02/10/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManger
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to the Weather application").bold().font(.title)
                Text("Please allow location access to get the weather information")
                    .font(.subheadline)
                    .padding()
            }.multilineTextAlignment(.center).padding()
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(30).symbolVariant(.fill).foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

#Preview {
    WelcomeView()
}
