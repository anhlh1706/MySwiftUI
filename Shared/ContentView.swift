//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI
import Combine
import CoreLocation

let myUUIDKey = "MyUUID"

class BeaconDetecter: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var locationManager: CLLocationManager?
    
    var lastDistance = CLProximity.unknown
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func startScanning() {
        var uuid = UUID()
        if let myStore = UserDefaults.standard.value(forKey: myUUIDKey) as? UUID {
            uuid = myStore
        }
        UserDefaults.standard.setValue(uuid, forKey: myUUIDKey)
        let constraint = CLBeaconIdentityConstraint(uuid: uuid, major: 123, minor: 456)
        
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "MyBeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: constraint)
    }
    
    func update(distance: CLProximity) {
        lastDistance = distance
        objectWillChange.send(())
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
        } else {
            update(distance: .unknown)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    
                }
            }
        }
    }
}

struct BigText: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 25))
            .foregroundColor(.black)
    }
    
}

struct ContentView: View {
    
    @ObservedObject var detecter = BeaconDetecter()
    
    var body: some View {
        switch detecter.lastDistance {
        case .immediate:
            Text("Immediate!")
                .modifier(BigText())
        case .near:
            Text("Near!")
                .modifier(BigText())
        case .far:
            Text("Far!")
                .modifier(BigText())
        default:
            Text("Hello, world!")
                .modifier(BigText())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
