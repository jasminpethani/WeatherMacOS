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
     
     @IBOutlet weak var powerByOpenWeatherBtn: NSButton!
     @IBOutlet weak var quitBtn: NSButton!
     
     
     
     // Lifecycle methods
     
     override func viewDidLoad() {
          super.viewDidLoad()
          
          collectionView.dataSource = self
          collectionView.delegate = self
          
          updateUI()
     }
     
     override func viewWillAppear() {
          view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.0)
          
          quitBtn.styleButtonText(button: quitBtn, buttonName: "Quit", fontColor: NSColor.darkGray, alignment: NSTextAlignment.center, font: "Avenir Next", size: 11.0)
          
          powerByOpenWeatherBtn.styleButtonText(button: powerByOpenWeatherBtn, buttonName: "Powered by Openweather Map", fontColor: NSColor.darkGray, alignment: NSTextAlignment.center, font: "Avenir Next", size: 11.0)
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
     
     // Openup browser
     @IBAction func powerByWeatherAppClicked(_ sender: Any) {
          let url = URL(string: API_HOME_URL_WEATHER)!
          NSWorkspace.shared.open(url)
     }
     
     @IBAction func quitApplication(_ sender: Any) {
          NSApplication.shared.terminate(nil)
     }
}

//MARK:- CollectionView datasource and delegate methods

extension WeatherVC: NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {
     
     func numberOfSections(in collectionView: NSCollectionView) -> Int {
          return 1
     }
     
     func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
          return WeatherService.instance.forecasts.count
     }
     
     func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
          let forecastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "WeatherCell"), for: indexPath) as! WeatherCell
          let forecast = WeatherService.instance.forecasts[indexPath.item]
          forecastItem.configureCell(forecast)
          return forecastItem
     }
     
     func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
          return NSSize(width: 125, height: 125)
     }
}
