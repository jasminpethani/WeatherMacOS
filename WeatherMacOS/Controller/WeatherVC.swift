//
//  ViewController.swift
//  WeatherMacOS
//
//  Created by jasmin on 13/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Cocoa

class WeatherVC: NSViewController {

     // Outlets
     @IBOutlet weak var todayDateLbl: NSTextField!
     @IBOutlet weak var tempratureLbl: NSTextField!
     @IBOutlet weak var locationLbl: NSTextField!
     
     @IBOutlet weak var weatherImgView: NSImageView!
     @IBOutlet weak var weatherLbl: NSTextField!
     
     @IBOutlet weak var collectionView: NSCollectionView!
     
     
     // Lifecycle methods
     
     override func viewDidLoad() {
          super.viewDidLoad()
          
          collectionView.dataSource = self
          collectionView.delegate = self
          
          updateUI()
     }
     
     override func viewDidAppear() {
          self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.0)
     }
     
     fileprivate func updateUI() {
          let weather = WeatherService.instance.currentWeather
          todayDateLbl.stringValue = weather.date
          tempratureLbl.stringValue = "\(weather.currentTemp)°"
          locationLbl.stringValue = weather.cityName
          
          weatherImgView.image = NSImage(named: NSImage.Name(weather.weatherType))
          weatherLbl.stringValue = weather.weatherType
     }
     
     override var representedObject: Any? {
          didSet {
          // Update the view, if already loaded.
          }
     }
}

//MARK:- CollectionView datasource and delegate methods

extension WeatherVC: NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {
     
     func numberOfSections(in collectionView: NSCollectionView) -> Int {
          return 1
     }
     
     func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
          return 7
     }
     
     func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
          let forecastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "WeatherCell"), for: indexPath)
          
          return forecastItem
     }
     
     func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
          return NSSize(width: 125, height: 125)
     }
}
