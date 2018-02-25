//
//  AppDelegate.swift
//  WeatherMacOS
//
//  Created by jasmin on 13/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

     // object of NSStatusItem which let's you set icon on statubar (at top)
     let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

     func applicationDidFinishLaunching(_ aNotification: Notification) {
          // Will show title and action of status bar button item here
          statusItem.button?.title = "__°🌦"
          statusItem.action = #selector(AppDelegate.displayPopup(_:))
          
          WeatherService.instance.downloadWeatherDetail() {
               WeatherService.instance.downloadForecast {
                    DispatchQueue.main.async {
                         self.statusItem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
                    }
               }
          }
          
        
     }

     func applicationWillTerminate(_ aNotification: Notification) {
          // Insert code here to tear down your application
     }

     // MARK:- Other action methods
     
     @objc func displayPopup(_ sender: AnyObject) {
          let mainStoryboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
          guard let vc = mainStoryboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "WeatherVC")) as? NSViewController else { return }
          
          
          // setting up view controller manually in popover
          let popover = NSPopover()
          popover.contentViewController = vc
          popover.behavior = .transient
          popover.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: NSRectEdge.maxY)
     }

}

