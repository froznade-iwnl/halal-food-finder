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
    var address: String
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $mapData.region, annotationItems: mapData.location) { location in
                MapMarker(coordinate: location.coordinate, tint: Color.bgColor)
            }
            
        }
        .onAppear{
            mapData.getMap(from: address)
        }
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(address: "One-North Singapore")
    }
}
