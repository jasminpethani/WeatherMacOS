//
//  Extension+Button.swift
//  WeatherMacOS
//
//  Created by jasmin on 25/02/18.
//  Copyright © 2018 jasmin. All rights reserved.
//

import Cocoa

extension NSButton {
     
     func styleButtonText(button: NSButton, buttonName: String, fontColor: NSColor, alignment: NSTextAlignment, font: String, size: CGFloat) {
          let paragraphStyle = NSMutableParagraphStyle()
          paragraphStyle.alignment = alignment
          
          
          let attributes: [NSAttributedStringKey: Any] = [
               NSAttributedStringKey.font: NSFont(name: font, size: size)!,
               NSAttributedStringKey.paragraphStyle: paragraphStyle,
               NSAttributedStringKey.foregroundColor: fontColor
          ]
          
          button.attributedTitle = NSAttributedString(string: buttonName, attributes: attributes)
     }
}
