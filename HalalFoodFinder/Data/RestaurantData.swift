//
//  RestaurantData.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 12/11/22.
//

import Foundation

struct restaurant: Codable, Identifiable{
    let id = UUID()
    
    var name: String
    var roadNumber: Int?
    var roadName: String
    var unitNumber: String
    var buildingName: String
    var postalCode: Int
    var tags: String
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
