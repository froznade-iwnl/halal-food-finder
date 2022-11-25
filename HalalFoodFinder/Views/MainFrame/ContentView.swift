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
    @State private var tabSelection = 1
    @StateObject var mapManager = ContentViewModel()
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            HomeView(tabSelection: $tabSelection, data: restaurants.restaurants)
                .tabItem {
                    Label("Home", systemImage: "fork.knife.circle")
                }
                .tag(1)
            
            AllRestaurantsView(datas: restaurants.restaurants)
                .tabItem {
                    Label("Restaurants", systemImage: "magnifyingglass.circle")
                }
                .tag(2)
            
            NearestRestaurantView(data: restaurants.restaurants)
                .tabItem {
                    Label("Near me", systemImage: "map.circle")
                }
                .tag(3)
            
        }
        .accentColor(.bgColor)
        .onAppear{
                mapManager.checkIfLocationsServiceIsEnabled()
                restaurants.sortByDistance(location: mapManager.myLocation!)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
