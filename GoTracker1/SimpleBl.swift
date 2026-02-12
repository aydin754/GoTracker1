//
//  SimpleBl.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 2/4/26.
//
import Foundation
import CoreBluetooth
import Combine

class BluetoothSimple: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    @Published var devices: [CBPeripheral] = []
    @Published var status = "Scanning..."
    
    var manager: CBCentralManager!
    
    override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            status = "Scanning..."
            manager.scanForPeripherals(withServices: nil)
        } else {
            status = "Bluetooth Off"
        }
        
    };func centralManager(_ central: CBCentralManager,
                         didDiscover peripheral: CBPeripheral,
                         advertisementData: [String: Any],
                         rssi RSSI: NSNumber) {
        
        if !devices.contains(where: { $0.identifier == peripheral.identifier }) {
            devices.append(peripheral)
        }
        
        
    }
    
    func connect(to device: CBPeripheral) {
        manager.connect(device, options: nil)
        status = "Connecting to \(device.name ?? "Device")..."
    }
    
    func centralManager(_central: CBCentralManager,
                        didConnect peripheral: CBPeripheral) {
        status = "Connected to \(peripheral.name ?? "Device")"
    }
}
