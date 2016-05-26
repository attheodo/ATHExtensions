//
//  Dictionary+Extensions.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 26/05/16.
//
//

import Foundation

extension Dictionary {
    
    /**
     Indicated whether the dictionary contains the specified key
     
     - parameter key: The key to check for existance
     - returns: A boolean indicating whether the key is presente in 
     the dictionary
    */
    public func containsKey(key: Key) -> Bool {
        return indexForKey(key) != nil
    }
}