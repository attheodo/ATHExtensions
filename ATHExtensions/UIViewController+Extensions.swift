//
//  UIViewController+Extensions.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 26/05/16.
//
//

import Foundation
import UIKit

extension UIViewController {
    
    /// A reference to app's delegate
    public var appDelegate: UIApplicationDelegate? {
        return UIApplication.sharedApplication().delegate
    }
    
    /// A reference to the current navigationBar if any
    public var navigationBar: UINavigationBar? {
        
        get {
            return navigationController?.navigationBar
        }
    
    }
    
    /// Reference to navigationItem's titleView
    public var titleView: UIView? {
    
        get {
            return navigationItem.titleView
        }
        
        set (value) {
            navigationItem.titleView = value
        }
    
    }
    
    /**
     Presents a view controller modally.
     
     - parameter vc: A `UIViewController` to present
    */
    public func present(vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }
    
    /**
     Dismisses the view controller that was presented modally by the view controller.
     
     The presenting view controller is responsible for dismissing the view controller it presented. 
     If you call this method on the presented view controller itself, UIKit asks the presenting 
     view controller to handle the dismissal.
    */
    public func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
