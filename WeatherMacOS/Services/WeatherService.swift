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
     var forecasts      = [Forecast]()
     
     private init() {}
     
     func downloadWeatherDetail(_ completion: @escaping DownloadComplete) {
          let url = URL(string: API_URL_CURRENT_WEATHER)
          Alamofire.request(url!).responseJSON { (response) in
               response.result.withError { (error) in
                    debugPrint(error.localizedDescription)
               }
               
               response.result.ifSuccess {
                    self.currentWeather = CurrentWeather.loadCurrentWeatherData(response.data!)
                    completion()
               }
          }
     }
     
     
     func downloadForecast(_ completion: @escaping DownloadComplete)  {
          let url = URL(string: API_URL_WEATHER_FORECAST)
          Alamofire.request(url!).responseJSON { (response) in
               response.result.withError { (error) in
                    debugPrint(error.localizedDescription)
               }
               
               response.result.ifSuccess {
                    self.forecasts = Forecast.loadForecastFromData(response.data!)
                    debugPrint("Loading forecast weather apps: ", self.forecasts.count)
                    completion()
               }
          }
     }
     
}
