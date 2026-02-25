//
//  Admin2dav.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 1/16/26.
//
import SwiftUI
import CoreBluetooth
struct searchForBLView: View {
    @StateObject var bluetooth = BluetoothSimple()
    var body: some View {
        VStack{
            Text(bluetooth.status)
                .font(.headline)
                .padding()
                .foregroundStyle(.orange)
            
            List(bluetooth.devices, id: \.identifier) { device in
                Button{
                    bluetooth.connect(to: device)
                } label: {
                    Text(device.name ?? "Unknown Device")
                }
            }
        }
        
    }
}

