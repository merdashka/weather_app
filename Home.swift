//
//  Home.swift
//  WeatherApp
//
//  Created by MacBook on 10.10.23.
//

import SwiftUI

struct Home: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather{
                    Text("Weather fetching!")
                } else {
                    ProgressView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.longitude, longitude: location.longitude)
                            }
                            catch {
                                print ("Something wrong!\(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                ProgressView()
            }
else {
                Welcome()
                    .environmentObject(locationManager)
            }
        }
    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("light"))    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
