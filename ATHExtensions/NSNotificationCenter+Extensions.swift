//
//  NSNotificationCenter+Extensions.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 26/05/16.
//
//

import Foundation

extension NSNotificationCenter {
    
    /**
     Creates a notification with a given name, sender, and information and posts it to the receiver.
     
     - parameter name: The name of the notification.
     - parameter object: The object posting the notification.
     - parameter userInfo: Information about the the notification.
     
    */
    public static func post(name: String, object: AnyObject? = nil, userInfo: [NSObject: AnyObject]? = nil) {
        
        let nc = self.defaultCenter()
        nc.postNotificationName(name, object: object, userInfo: userInfo)
        
    }
    
    /**
    Registers for a notification name and executes a block when the notification is received
     
     - parameter name: The name of the notification.
     - parameter block: The block of code to be executed when the notification is received

    - returns: an opaque object to act as the observer.
     
    */
    public static func subscribe(name: String, block: (NSNotification -> Void)) -> NSObjectProtocol {
        
        let nc = self.defaultCenter()
        return nc.addObserverForName(name, object: nil, queue: nil) { notification in
            block(notification)
        }
        
    }
    
    /**
     Registers an observer for a notification name, a selector to be executed when the notification is received
     and optionally the object whose notifications the observer wants to receive.
     
     - parameter observer: Object registering as an observer. This value must not be nil.
     - parameter name: The name of the notification for which to register the observer; that is, 
     only notifications with this name are delivered to the observer.
     - parameter selector: Selector that specifies the message the receiver sends notificationObserver 
     to notify it of the notification posting.
     - parameter object: The object whose notifications the observer wants to receive; that is, only notifications sent 
     by this sender are delivered to the observer.
    */
    public static func subscribe(observer: AnyObject, name: String, selector: Selector, object: AnyObject? = nil) {
        
        let nc = self.defaultCenter()
        return nc.addObserver(observer, selector: selector, name: name, object: object)
        
    }
    
    /**
     Registers an observer for a list of notifications along with their selectors to be executed when the respective
     notification is received.
     
     - parameter observer: Object registering as an observer. This value must not be nil.
     - parameter notifications: A dictionary with notification names as keys and their selectors as values
     - parameter object: The object whose notifications the observer wants to receive; that is, only notifications sent
     by this sender are delivered to the observer.

    */
    public static func subscribe(observer: AnyObject, _ notifications: [String: Selector], object: AnyObject? = nil) {
        
        for (name, selector) in notifications {
            subscribe(observer, name: name, selector: selector, object: object)
        }
        
    }
    
    /**
     Unregisters an observer from the specified notifications.
     
     - parameter observer: Observer to remove from the dispatch table.
     - parameter name: Name of the notification to remove from dispatch table.
    */
    public static func unsubscribe(observer: AnyObject, name: String? = nil, object: AnyObject? = nil) {
        
        let nc = self.defaultCenter()
        return nc.removeObserver(observer, name: name, object: object)
        
    }
    
    /**
    Unregisters an observer from a list of notifications.
     
     - parameter observer: Observer to remove from the dispatch table.
     - parameter names: An array of notification names to remove from the dispatch table.
    */
    public static func unsubscribe(observer: AnyObject, _ names: [String], object: AnyObject? = nil) {
        
        for name in names {
            unsubscribe(observer, name: name, object: object)
        }
        
    }
}