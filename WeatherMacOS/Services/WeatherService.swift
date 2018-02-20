//
//  WeatherService.swift
//  WeatherMacOS
//
//  Created by jasmin on 20/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
     static let instance = WeatherService()
     var currentWeather = CurrentWeather()
     
     private init() {}
     
     func downloadWeatherDetail(_ completion: @escaping DownloadComplete) {
          let url = URL(string: API_URL_CURRENT_WEATHER)
          Alamofire.request(url!).responseJSON { (response) in
                response.result.ifSuccess {
                    self.currentWeather = CurrentWeather.loadCurrentWeatherData(response.data!)
                    completion()
               }
          }
     }
     
}
