//
//  Constants.swift
//  WeatherMacOS
//
//  Created by jasmin on 20/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> Void


let API_HOME_URL_WEATHER = "https://openweathermap.org/"


// Web APIs

let API_KEY = "&appid=56fb57d414af67154e32d7c70743051a"
let API_UNITS = "&units=imperial"
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139\(API_UNITS)\(API_KEY)"
let API_URL_WEATHER_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10\(API_UNITS)\(API_KEY)"
