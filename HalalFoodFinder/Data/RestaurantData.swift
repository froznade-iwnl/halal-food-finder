//
//  RestaurantData.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import Foundation
import CoreLocation
import SwiftUI

struct restaurant: Codable, Identifiable{
    let id = UUID()
    
    var name: String
    
    var roadNumber: String = ""
    var roadName: String
    var unitNumber: String
    var buildingName: String
    var postalCode: Int
    
//    var distance: Double = -1
    
    var tags: String
    
    func getAddress() -> String {
        return "\(roadName), \(postalCode), Singapore"
    }
    
    func getLocation() -> [Location] {
        let address = self.getAddress()
        do{
            MapAPI().getLocation(address: address, delta: 0.025)
            
        }
        return MapAPI().locations
    }
}

class restaurantDataGrabber: ObservableObject {
    @Published var restaurants: [restaurant] = []
    
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
            self.restaurants = try! decoder.decode([restaurant].self, from: data!)
            self.restaurants.shuffle()
            print(self.restaurants)
        }catch{
            print(error)
        }
    }
}
