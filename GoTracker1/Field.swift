//
//  Field.swift
//  GoTracker1
//
//  Created by Veer Patel on 1/21/26.
//

import SwiftUI
import MapKit

struct Field: View {
    
    @StateObject var bluetooth = BluetoothManager()
    
    let fieldMap = CLLocationCoordinate2D(latitude: 42.105447, longitude: -87.956916)
    
    @State var coordinates = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.105447, longitude: -87.956916),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [
                    Color.black,
                    Color.orange.opacity(0.9),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            Map(
                coordinateRegion: $coordinates,
                annotationItems: [
                    LocationPoint(
                        latitude: bluetooth.latitude,
                        longitude: bluetooth.longitude
                    )
                ]
            ) { location in
                
                MapMarker(
                    coordinate: CLLocationCoordinate2D(
                        latitude: location.latitude,
                        longitude: location.longitude
                    )
                )
            }
            .mapStyle(.imagery)
            .onAppear {
                autoZoom(center: fieldMap)
            }
            .onChange(of: bluetooth.latitude) { _ in
                coordinates.center = CLLocationCoordinate2D(
                    latitude: bluetooth.latitude,
                    longitude: bluetooth.longitude
                )
            }
            
            // 🔍 GPS DEBUG DISPLAY
            VStack {
                Spacer()
                
                VStack {
                    Text("Lat: \(bluetooth.latitude)")
                    Text("Lng: \(bluetooth.longitude)")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
                .padding()
            }
        }
    }
    
    // Zoom the map tightly to the field
    func autoZoom(center: CLLocationCoordinate2D) {
        let tightSpan = MKCoordinateSpan(latitudeDelta: 0.0004, longitudeDelta: 0.0004)
        coordinates = MKCoordinateRegion(center: center, span: tightSpan)
    }
}

struct LocationPoint: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
}
