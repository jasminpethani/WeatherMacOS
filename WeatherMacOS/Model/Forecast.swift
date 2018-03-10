//
//  Forecast.swift
//  WeatherMacOS
//
//  Created by jasmin on 24/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Foundation
import SwiftyJSON

class Forecast {
     var date:String!
     var weatherType: String!
     var highTemp: Int = 0
     var lowTemp: Int = 0
     
     class func loadForecastFromData(_ data: Data) -> [Forecast] {
          guard let json = try? JSON(data: data) else { fatalError() }
          var f = [Forecast]()
          
          if let list = json["list"].array {
               for day in list {
                    let dayForecast = Forecast()
                    dayForecast.highTemp = day["temp"]["max"].intValue
                    dayForecast.lowTemp  = day["temp"]["min"].intValue
                    dayForecast.weatherType = day["weather"][0]["name"].stringValue
                    
                    let date = day["dt"].doubleValue
                    let unixConvertedDate = Date(timeIntervalSince1970: date)
                    dayForecast.date = unixConvertedDate.dayOfTheWeek()
                    
                    f.append(dayForecast)
               }
          }
          
          return f
     }
     
}
