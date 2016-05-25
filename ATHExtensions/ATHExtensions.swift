//
//  ATHExtensions.swift
//  ATHExtensions
//
//  Created by Athanasios Theodoridis on 25/05/16.
//
//

import Foundation

public struct App {
    
    /// Returns an optional string containing `CFBundleDisplayName`
    public static var bundleDisplayName: String? {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleDisplayName") as? String
    }
    
    /// Returns an optional string containing `CFBundleName`
    public static var bundleName: String? {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as? String
    }
    
    /// Returns the app's version number (`CFBundleShortVersionString`)
    public static var version: String? {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String
    }
    
    /// Returns the app's build number (`kCFBundleVersionKey`)
    public static var buildNumber: String? {
        return NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as? String
    }
    
    /// Returns the app's version and build number
    public static var versionWithBuildNumber: String? {
        
        guard let version = self.version, buildNumber = self.buildNumber else {
            return nil
        }
        
        if version == buildNumber {
            return "v\(version)"
        } else {
            return "v\(version) (b\(buildNumber))"
        }
    
    }
    
    /// Returns a boolean indicating whether "Debug" configuration is active
    public static var isDebug: Bool {
        
        #if DEBUG
            return true
        #else
            return false
        #endif
    
    }
    
    /// Returns a boolean indicating whether a production configuration is active
    public static var isRelease: Bool {
        return !isDebug
    }
    
    /// Returns a boolean indicating whether the app is currently being run in unit-testing mode
    public static var isBeingTested: Bool {
        return NSProcessInfo.processInfo().environment["XCInjectBundle"] != nil
    }
    
    /// returns a boolean indicating whether the apps is currently being run in UI testing mode
    public static var isBeingUITested: Bool {
        return NSProcessInfo.processInfo().arguments.contains("-ui_testing")
    }
    
    /// Returns a boolean indicating whether the app is running on the simulator
    public static var isRunningOnSimulator: Bool {
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            return true
        #else
            return false
        #endif
    }
    
    /// Returns a boolean indicating whether the app is running on a device
    public static var isRunningOnDevice: Bool {
        return !isRunningOnSimulator
    }
    
    /// A reference to the application delegate
    public static var delegate: UIApplicationDelegate? {
        return UIApplication.sharedApplication().delegate
    }
}
