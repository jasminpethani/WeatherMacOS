//
//  Constants.swift
//  WeatherMacOS
//
//  Created by jasmin on 20/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> Void


let HOME_URL = "https://openweathermap.org/"

// Notification

let NOTIFICATION_DOWNLOAD_WEATHER = NSNotification.Name("downloadWeatherNotification")


// Location

let LAT = LocationService.instance.currentLocation.coordinate.latitude
let LON = LocationService.instance.currentLocation.coordinate.longitude


// Web APIs

let API_KEY = "&appid=56fb57d414af67154e32d7c70743051a"
let API_UNITS = "&units=imperial"
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=\(LAT)&lon=\(LON)\(API_UNITS)\(API_KEY)"
let API_URL_WEATHER_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(LAT)&lon=\(LON)&cnt=8\(API_UNITS)\(API_KEY)"
