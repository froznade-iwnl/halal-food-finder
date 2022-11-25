//
//  RestaurantData.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

struct Restaurant: Codable, Identifiable{
    
    var id: Int
    var name: String
    var tags: String
    var address: String
    var latitude: String
    var longitude: String
    
    var location: CLLocation {
        return CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
    }
    
    func distance(to location: CLLocation) -> CLLocationDistance {
        return location.distance(from: self.location)
    }
    
}

class restaurantDataGrabber: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    
    init(){
        grabData()
    }
    
    func grabData(){
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json")
        else{
            print("JSON not found")
            return
        }
        do{
            let decoder = JSONDecoder()
            let data = try? Data(contentsOf: url)
            self.restaurants = try! decoder.decode([Restaurant].self, from: data!)
            self.restaurants.shuffle()
        }catch{
            print(error)
        }
    }
    
    func sortByDistance(location: CLLocation) {
        self.restaurants.sort(by: { $0.distance(to: location) < $1.distance(to: location) })
    }
}

