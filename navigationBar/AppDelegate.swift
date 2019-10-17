//
//  AppDelegate.swift
//  navigationBar
//
//  Created by Wouter van de Kamp on 24/09/2019.
//  Copyright © 2019 Wouter van de Kamp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let _ = FitsocietyTheme(navBar: true, searchBar: true, segmentedControl: true)
        
        return true
    }
}

