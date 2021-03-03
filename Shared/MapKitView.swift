//
//  MapKitView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 03/03/2021.
//

import SwiftUI
import MapKit

struct MapKitView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}
