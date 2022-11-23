//
//  MapView.swift
//  HalalFoodFinder
//
//  Created by CTSS Students on 14/11/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var mapData = MapData()
    var data: Restaurant
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $mapData.region, annotationItems: mapData.location) { location in
                MapMarker(coordinate: location.coordinate, tint: Color.bgColor)
            }
            
        }
        .onAppear{
            mapData.getMap(from: data)
        }
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(data: Restaurant(id: 0, name: "testing", tags: "western", address: "65, AIRPORT BOULEVARD B2-02, CHANGI AIRPORT TERMINAL 3, 819663 Singapore", latitude: "1.3559270153846200", longitude: "103.98648331538500"))
    }
}
