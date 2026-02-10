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
    }
}
