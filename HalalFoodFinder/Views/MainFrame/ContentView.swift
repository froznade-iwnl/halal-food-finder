//
//  ContentView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 5/11/22.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @StateObject var restaurants = restaurantDataGrabber()
    
    var body: some View {
        
        TabView {
            HomeView(data: restaurants.restaurants)
                .tabItem {
                    Label("Home", systemImage: "fork.knife.circle")
                }
            
            NearestRestaurantView()
                .tabItem {
                    Label("Near me", systemImage: "map.circle")
                }
            
        }
        .accentColor(.bgColor)
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
