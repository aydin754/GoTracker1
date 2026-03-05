//
//  BluetoothManager.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 3/5/26.
//
import CoreBluetooth
import SwiftUI

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    
    private var centralManager: CBCentralManager!
    private var gspPeripheral: CBPeripheral?
    
    //  switch freidns UUIDS
    let serviceUUID = CBUUID(string: "1234")
    let characteristicUUID = CBUUID(string: "5678")
    
    
    
}
