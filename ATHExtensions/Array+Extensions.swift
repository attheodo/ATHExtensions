//
//  Array+Extensions.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 26/05/16.
//
//

import Foundation

extension Array where Element: Equatable {
    
    /**
     Returns an array with the indices where the object
     appears in the collection.
     
     - parameter object: The object of which the indices we want to find
     - returns: An array of `Int` indices
    */
    public func indexesOf(object: Element) -> [Int] {
       
        var indexes: [Int] = []
    
        for index in 0..<self.count {
            if self[index] == object {
                indexes.append(index)
            }
        }
        
        return indexes
    
    }
    
    /**
     Returns an array with the indices where the object
     appears in the collection.
     
     - parameter object: The object of which the indices we want to find
     - returns: An array of `Int` indices
     */

    public func indicesOf(object: Element) -> [Int] {
        return self.indexesOf(object)
    }
    
    /**
     Removes the first occurence of the object from the collection
     
     - parameter object: The object to remove from the collection
    */
    public mutating func removeObject(object : Element) {
    
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    
    }
    
    /**
     Removes all the occurences of the object from the collection
     
     - parameter object: The object of which all the occurences to be removed
     from the collection
    */
    public mutating func removeAllOccurencesOfObject(object: Element) {
      
        for i in self.indexesOf(object).reverse() {
            self.removeAtIndex(i)
        }
    
    }

}