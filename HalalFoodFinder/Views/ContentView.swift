//
//  ContentView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 5/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var restaurants = restaurantDataGrabber()
    
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
        .onAppear {
            restaurants.grabData()
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
