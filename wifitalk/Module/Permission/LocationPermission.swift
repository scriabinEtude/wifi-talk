//
//  PermissionManager.swift
//  wifitalk
//
//  Created by escher on 2023/06/13.
//

import SwiftUI
import CoreLocation

class LocationPermission: NSObject {
    private let locationManager = CLLocationManager()
    private var authorisationStatus: CLAuthorizationStatus = .notDetermined
    
    var isAuthorised: Bool {
        self.authorisationStatus == .authorizedAlways
        || self.authorisationStatus == .authorizedWhenInUse
    }

    override init() {
        super.init()
        self.locationManager.delegate = self
        requestAuthorization(always: true)
    }
    
    public func requestAuthorizationFromSettingScreen() {
        UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
    }

    public func requestAuthorization(always: Bool = false) {
        if always {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationPermission: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorisationStatus = status
    }
}
