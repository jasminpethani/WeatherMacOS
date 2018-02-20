//
//  WeatherCell.swift
//  WeatherMacOS
//
//  Created by jasmin on 19/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {
     
     // Outlets
     @IBOutlet weak var dayLbl: NSTextField!
     @IBOutlet weak var lowTempLbl: NSTextField!
     @IBOutlet weak var highTempLbl: NSTextField!
     
      @IBOutlet weak var weatherCellImage: NSImageView!

     override func viewDidLoad() {
          super.viewDidLoad()
          self.view.wantsLayer = true
          self.view.layer?.backgroundColor = CGColor(red: 0.69, green: 0.85, blue: 0.99, alpha: 0.5)
          self.view.layer?.cornerRadius = 5.0
     }
    
}
