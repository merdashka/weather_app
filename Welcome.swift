//
//  Welcome.swift
//  WeatherApp
//
//  Created by MacBook on 10.10.23.
//

import SwiftUI
import UIKit
import CoreLocationUI

struct Welcome: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 30, content:{
                
                
                    
                Text("Check the weather\nin your city")
                .font(
                Font.custom("DM Sans", size: 36)
                .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 339, alignment: .top)
                
                
                Text("Please share your location for an\naccurate weather forecast")
                .font(
                Font.custom("DM Sans", size: 16)
                .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                
            })
            
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .foregroundColor(.white)
            
            
        }
        
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
