//
//  Extension+Date.swift
//  WeatherMacOS
//
//  Created by jasmin on 24/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Foundation

extension Date {
     // Returns day of week like "friday", "sunday"
     func dayOfTheWeek() -> String {
          let df = DateFormatter()
          df.dateFormat = "EEEE"
          return df.string(from: self)
     }
}

