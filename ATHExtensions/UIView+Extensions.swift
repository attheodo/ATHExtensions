//
//  UIView+Extensions.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 26/05/16.
//
//

import UIKit
import Foundation
import QuartzCore

extension UIView {
    
    /**
     Direction of the linear gradient
     
     - Vertical:                            Linear gradient vertical
     - Horizontal:                          Linear gradient horizontal
     - DiagonalFromLeftToRightAndTopToDown: Linear gradient from left to right and top to down
     - DiagonalFromLeftToRightAndDownToTop: Linear gradient from left to right and down to top
     - DiagonalFromRightToLeftAndTopToDown: Linear gradient from right to left and top to down
     - DiagonalFromRightToLeftAndDownToTop: Linear gradient from right to left and down to top
     */
    public enum UIViewLinearGradientDirection : Int {
        case Vertical
        case Horizontal
        case DiagonalFromLeftToRightAndTopToDown
        case DiagonalFromLeftToRightAndDownToTop
        case DiagonalFromRightToLeftAndTopToDown
        case DiagonalFromRightToLeftAndDownToTop
    }
    
    // MARK: - Properties
    /// The `x` origin of the view
    public var x: CGFloat {
        
        get {
            return self.frame.origin.x
        }
        set (value) {
            self.frame = CGRect(x: value, y: self.y, width: self.width, height: self.height)
        }
    
    }
    
    /// The `y` origin of the view
    public var y: CGFloat {
    
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.x, y: value, width: self.width, height: self.height)
        }
    
    }
    
    /// The `width` of the view's frame size
    public var width: CGFloat {
    
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: value, height: self.height)
        }
    
    }
    
    /// The `height` of the view's frame size
    public var height: CGFloat {
    
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: value)
        }
    
    }
    
    /// The `leading` (x) point of the view
    public var leading: CGFloat {
    
        get {
            return self.x
        } set(value) {
            self.x = value
        }
    
    }
    
    /// The `trailing` point of the view
    public var trailing: CGFloat {
    
        get {
            return self.x + self.width
        } set(value) {
            self.x = value - self.width
        }
    
    }
    
    /// The `top` origin of the view
    public var top: CGFloat {
       
        get {
            return self.y
        } set(value) {
            self.y = value
        }
    
    }
    
    /// The `bottom` point of the view
    public var bottom: CGFloat {
    
        get {
            return self.y + self.height
        } set(value) {
            self.y = value - self.height
        }
    
    }
    
    // MARK: - Public Methods
    /**
     Loads, instantiates and returns a Nib file as a `UIView`
     
     - parameter nibName: The name of the Nib file
     - parameter bundle: The bundle in which to search for the nib file. If you specify nil,
     this method looks for the nib file in the main bundle.
     
     - returns: A `UIView` with the contents of the Nib
     */
    public static func loadFromNibWithName(nibName: String, bundle: NSBundle? = nil) -> UIView? {
        return UINib(nibName: nibName, bundle: bundle).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    /**
     Sets the corner radius of the view
     
     - parameter radius: The radius to use when drawing rounded corners for the layer’s background.
    */
    public func setCornerRadius(radius radius: CGFloat) {
      
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    
    }
    
    /**
     Creates a border around the view's layer
     
     - parameter width: The width of the border line
     - parameter color: The color of the border line
    */
    public func addBorderWithWidth(width: CGFloat, andColor color: UIColor) {
        
        self.layer.borderWidth = width
        self.layer.borderColor = color.CGColor
        self.layer.masksToBounds = true
        
    }
    
    /**
     Adds a border at the top of the view
     
     - parameter size: The width of the border line
     - parameter color: The color of the border line
    */
    public func addTopBorderWithSize(size: CGFloat, andColor color: UIColor) {
        addBorder(x: 0, y: 0, width: self.frame.width, height: size, color: color)
    }
    
    /**
     Adds a border at the bottom of the view
     
     - parameter size: The width of the border line
     - parameter color: The color of the border line
    */
    public func addBottomBorderWithSize(size: CGFloat, andColor color: UIColor) {
        addBorder(x: 0, y: self.frame.height - size, width: self.frame.width, height: width, color: color)
    }
    
    /**
     Adds a border at the left part of the view
     
     - parameter size: The width of the border line
     - parameter color: The color of the border line
    */
    public func addLeftBorderWithSize(size: CGFloat, andColor color: UIColor) {
        addBorder(x: 0, y: 0, width: size, height: self.frame.height, color: color)
    }
    
    /**
     Adds a border at the right part of the view
     
     - parameter size: The width of the border line
     - parameter color: The color of the border line
    */
    public func addBorderRight(size size: CGFloat, color: UIColor) {
        addBorder(x: self.frame.width - size, y: 0, width: size, height: self.frame.height, color: color)
    }
    
    /**
     Fades in a view by animating its `alpha` property
     
     - parameter duration: The duration of the animationa (Default: 1 second)
     - parameter delay: The delay before the animation starts (Default: 0 seconds)
     - parameter completion: An optional block of code to be executed when the animation finishes
    */
    public func fadeIn(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void)? ){
        
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)
    
    }
    
    /**
     Fades out a view by animating its `alpha` property
     
     - parameter duration: The duration of the animationa (Default: 1 second)
     - parameter delay: The delay before the animation starts (Default: 0 seconds)
     - parameter completion: An optional block of code to be executed when the animation finishes
     */
    public func fadeOut(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void)? ){
    
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    
    }
    
    /**
     Adds a tap gesture recognizer to the view
     
     - parameter taps: The number of taps required (Default: 1)
     - parameter target: An object that is the recipient of action messages sent by the receiver when it recognizes a gesture.
     - parameter action: A selector to be called when the recognizer is detected
    */
    public func addTapGestureWithNumberOfTaps(taps: Int = 1, target: AnyObject, action: Selector) {
        
        self.userInteractionEnabled = true
        
        let recognizer = UITapGestureRecognizer(target: target, action: action)
        recognizer.numberOfTapsRequired = taps
        
        addGestureRecognizer(recognizer)
    
    }
    
    /**
     Adds a swipe gesture recognizer to the view
     
     - parameter direction: The direction of the swipe
     - parameter target: An object that is the recipient of action messages sent by the receiver when it recognizes a gesture.
     - parameter action: A selector to be called when the recognizer is detected
     */
    public func addSwipeGesture(direction direction: UISwipeGestureRecognizerDirection, target: AnyObject, action: Selector) {
        
        self.userInteractionEnabled = true
        
        let recognizer = UISwipeGestureRecognizer(target: target, action: action)
        recognizer.direction = direction
        
        addGestureRecognizer(recognizer)
    
    }
    
    /**
     Adds a pan gesture recognizer to the view
     
     - parameter target: An object that is the recipient of action messages sent by the receiver when it recognizes a gesture.
     - parameter action: A selector to be called when the recognizer is detected
     */

    public func addPanGesture(target target: AnyObject, action: Selector) {
        
        self.userInteractionEnabled = true
        
        let recognizer = UIPanGestureRecognizer(target: target, action: action)
        addGestureRecognizer(recognizer)
        
    }
    
    /**
     Create a linear gradient
     
     - parameter colors:    Array of UIColor instances
     - parameter direction: Direction of the gradient
     */
    public func createGradientWithColors(colors: Array<UIColor>, direction: UIViewLinearGradientDirection) {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        
        let mutableColors: NSMutableArray = NSMutableArray(array: colors)
        for i in 0 ..< colors.count {
            let currentColor: UIColor = colors[i]
            mutableColors.replaceObjectAtIndex(i, withObject: currentColor.CGColor)
        }
        gradient.colors = mutableColors as AnyObject as! Array<UIColor>
        
        switch direction {
        
        case .Vertical:
            gradient.startPoint = CGPointMake(0.5, 0.0)
            gradient.endPoint = CGPointMake(0.5, 1.0)
        
        case .Horizontal:
            gradient.startPoint = CGPointMake(0.0, 0.5)
            gradient.endPoint = CGPointMake(1.0, 0.5)
        
        case .DiagonalFromLeftToRightAndTopToDown:
            gradient.startPoint = CGPointMake(0.0, 0.0)
            gradient.endPoint = CGPointMake(1.0, 1.0)
        
        case .DiagonalFromLeftToRightAndDownToTop:
            gradient.startPoint = CGPointMake(0.0, 1.0)
            gradient.endPoint = CGPointMake(1.0, 0.0)
        
        case .DiagonalFromRightToLeftAndTopToDown:
            gradient.startPoint = CGPointMake(1.0, 0.0)
            gradient.endPoint = CGPointMake(0.0, 1.0)
        
        case .DiagonalFromRightToLeftAndDownToTop:
            gradient.startPoint = CGPointMake(1.0, 1.0)
            gradient.endPoint = CGPointMake(0.0, 0.0)
        }
        
        self.layer.insertSublayer(gradient, atIndex:0)
        
    }
    
    // MARK: - Private Methods
    private func addBorder(x x: CGFloat, y y: CGFloat, width width: CGFloat, height height: CGFloat, color color: UIColor) {
        
        let border = CALayer()
        
        border.backgroundColor = color.CGColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        
        self.layer.addSublayer(border)
        
    }

}
