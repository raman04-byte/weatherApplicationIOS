//
//  WeatherManager.swift
//  WeatherApplication
//
//  Created by Raman Tank on 02/10/24.
//

// Add the APIKEY from https://openweathermap.org/
// Create an account and than add the API KEY

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=YOURAPIKEY&units=metric") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
            
        print(decodedData)
        
        return decodedData
    }
}
