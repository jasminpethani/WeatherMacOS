//
//  CurrentWeather.swift
//  WeatherMacOS
//
//  Created by jasmin on 20/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWeather {
     
     var date: String!
     var cityName: String!
     var weatherType: String!
     var currentTemp: Int = 0
     
     
     class func loadCurrentWeatherData(_ data: Data) -> CurrentWeather {
          let currentWeather = CurrentWeather()
          let swiftyJSON = try! JSON(data: data)
          
          currentWeather.cityName = swiftyJSON["name"].stringValue.capitalized
          currentWeather.currentTemp = swiftyJSON["main"]["temp"].intValue
          currentWeather.weatherType = swiftyJSON["weather"][0]["main"].stringValue.capitalized

          let df = DateFormatter()
          df.dateStyle = .long
          df.timeStyle = .none
          
          currentWeather.date = "Today, " + df.string(from: Date())
          
          return currentWeather
     }
}
