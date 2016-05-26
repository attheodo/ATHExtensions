//
//  UIColor+Extensions.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 26/05/16.
//
//

import Foundation
import UIKit

extension UIColor {
    
    /**
     Initializes and returns a color object using the specified opacity and RGB component values.
     An initialized color object. The color information represented by this object is in the device RGB colorspace.
     
     - parameter r: The red component of the color object, specified as a value from 0.0 to 255.0
     - parameter g: The green component of the color object, specified as a value from 0.0 to 255.0
     - parameter b: The blue component of the color object, specified as a value from 0.0 to 255.0
     - parameter a: The opacity value of the color object, specified as a value from 0.0 to 1.0.
     
     - returns: An initialized color object.
     */

    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /**
     Initializes and returns a color object using the specified opacity and hex value
     
     - parameter hex: A hex color string representing the color value
     - parameter alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0.
     
     - returns: An initialized color object.
    */
    convenience public init(hex h: String, alpha: CGFloat) {
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        if h.hasPrefix("#") {
            
            let index   = h.startIndex.advancedBy(1)
            let hex     = h.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            
            if scanner.scanHexLongLong(&hexValue) {
                
                switch (hex.characters.count) {
                case 3:
                    
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                    
                case 4:
                    
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    
                case 6:
                    
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                    
                case 8:
                    
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    
                default:
                    fatalError("Invalid hex string, number of characters after '#' should be either 3, 4, 6 or 8")
                }
            } else {
                fatalError("Scan hex error \(h)")
            }
        } else {
            fatalError("Invalid hex string: missing '#'")
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    
    }
}