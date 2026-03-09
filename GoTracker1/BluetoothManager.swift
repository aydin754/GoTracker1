//
//  BluetoothManager.swift
//  GoTracker1
//
//  Created by Aydin Metanovic on 3/5/26.
//
import CoreBluetooth
import SwiftUI
import Combine

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    
    private var centralManager: CBCentralManager!
    private var gpsPeripheral: CBPeripheral?
    
    // Replace with your friend's UUIDs
    let serviceUUID = CBUUID(string: "1234")
    let characteristicUUID = CBUUID(string: "5678")
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: [serviceUUID])
        }
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        
        gpsPeripheral = peripheral
        gpsPeripheral?.delegate = self
        
        centralManager.stopScan()
        centralManager.connect(peripheral)
    }
    
    func centralManager(_ central: CBCentralManager,
                        didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices([serviceUUID])
    }
    
    func peripheral(_ peripheral: CBPeripheral,
                    didDiscoverServices error: Error?) {
        
        guard let services = peripheral.services else { return }
        
        for service in services {
            peripheral.discoverCharacteristics([characteristicUUID], for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral,
                    didDiscoverCharacteristicsFor service: CBService,
                    error: Error?) {
        
        guard let characteristics = service.characteristics else { return }
        
        for characteristic in characteristics {
            peripheral.setNotifyValue(true, for: characteristic)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral,
                    didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?) {
        
        guard let data = characteristic.value,
              let string = String(data: data, encoding: .utf8) else { return }
        
        let parts = string.split(separator: ",")
        
        if parts.count == 2 {
            DispatchQueue.main.async {
                self.latitude = Double(parts[0]) ?? 0
                self.longitude = Double(parts[1]) ?? 0
            }
        }
    }
}
