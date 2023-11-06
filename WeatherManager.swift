//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by MacBook on 12.10.23.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    // OpenWeather API f49a5bcb365c296e6eb094bd210d2290
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&exclude={part}&appid=f49a5bcb365c296e6eb094bd210d2290&units=metric") else {fatalError("Something went wrong...")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, res) = try await URLSession.shared.data(for: urlRequest )
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinateResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinateResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feel_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse{
    var feelsLike: Decodable {return feel_like}
}
