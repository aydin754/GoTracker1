//
//  Field.swift
//  GoTracker1
//
//  Created by Veer Patel on 1/21/26.
//

import SwiftUI
import MapKit
struct Field: View {
    let fieldMap = CLLocationCoordinate2D(latitude: 42.105447, longitude: -87.956916)
    @State var coordinates = MKCoordinateRegion( center: CLLocationCoordinate2D(latitude: 42.105447, longitude: -87.956916), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var body: some View {
        Map(coordinateRegion: $coordinates)
            .mapStyle(.imagery)
            .onAppear() {
                autoZoom(center: fieldMap)
            }
    }
    func autoZoom(center: CLLocationCoordinate2D) {
        let tightSpan = MKCoordinateSpan(latitudeDelta: 0.0010 , longitudeDelta: 0.0010)
        coordinates = MKCoordinateRegion(center: center, span: tightSpan)
    }
}

#Preview {
    Field()
}
