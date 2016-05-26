//
//  NSMutableAttributeString+Extensions.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 26/05/16.
//
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    /**
     Sets the color of a substring inside the attributed string
     
     - parameter string: The string of which to change the color
     - parameter color: The new color of the string
    */
    public func setColorForString(string: String, color: UIColor) {
        
        let range = self.mutableString.rangeOfString(string, options:NSStringCompareOptions.CaseInsensitiveSearch);
        
        if range.location != NSNotFound {
            self.addAttribute(NSForegroundColorAttributeName, value: color, range: range);
        }
        
    }
    
}
