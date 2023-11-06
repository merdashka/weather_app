//
//  LocationManager.swift
//  WeatherApp
//
//  Created by MacBook on 10.10.23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject,CLLocationManagerDelegate {
    
    let maneger = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        maneger.delegate = self
    }
    func requestLocation(){
        isLoading = true
        maneger.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Ошибка обнаружения локации", error)
        isLoading = false
    }
}
