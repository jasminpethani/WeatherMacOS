//
//  LocationService.swift
//  WeatherMacOS
//
//  Created by jasmin on 26/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Cocoa
import CoreLocation

class LocationService: NSObject {
     static let instance = LocationService()
     
     var locationManager = CLLocationManager()
     
     var currentLocation: CLLocation! {
          didSet {
               if currentLocation != nil {
                    (NSApplication.shared.delegate as! AppDelegate).downloadWeatherData()
               }
          }
     }
     
     private override init() {
          super.init()
          locationManager.delegate = self
          locationManager.distanceFilter = 1000
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
          locationManager.startMonitoringSignificantLocationChanges()
          locationManager.startUpdatingLocation()
     }
}

extension LocationService: CLLocationManagerDelegate {
     
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
          debugPrint("Error: in getting location")
     }
     
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          guard let location = locations.last else { return }
          self.currentLocation = location
     }
}

