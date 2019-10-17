//
//  FitsocietyTheme.swift
//  navigationBar
//
//  Created by Wouter van de Kamp on 24/09/2019.
//  Copyright © 2019 Wouter van de Kamp. All rights reserved.
//

import Foundation
import UIKit

class FitsocietyTheme {
    
    init(navBar: Bool, searchBar: Bool, segmentedControl: Bool) {
        if navBar {
            applyFitsocietyNavigationBarStyle()
        }
        
        if searchBar {
            applyFitsocietySearchBarStyle()
        }
        
        if segmentedControl {
            applyFitsocietySegmentedControlStyle()
        }
    }
    
    private func applyFitsocietyNavigationBarStyle() {
        let navigationBar  = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        
        navigationBar.barTintColor  = .black /// Set background color to black
        navigationBar.barStyle      = .black /// Set all foreground colors to lighter colors
        
        /// Set translucent, this breaks scrolling so every view controller needs to be patched with `extendedLayoutIncludesOpaqueBars = true` and scrollsviews aligning towards the `superview`
        navigationBar.isTranslucent = false
        
        if #available(iOS 13.0, *) {
            let navigationBar               = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
            let navigationBarAppearance     = UINavigationBarAppearance()
            
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.backgroundColor             = .black
            
            navigationBarAppearance.titleTextAttributes         = [
                .foregroundColor: UIColor.white,
                //.font: regularFont
            ]
            
            navigationBarAppearance.largeTitleTextAttributes    = [
                .foregroundColor: UIColor.white,
                //.font: largeFont
            ]
                       
            navigationBar.standardAppearance     = navigationBarAppearance
            navigationBar.compactAppearance      = navigationBarAppearance
            navigationBar.scrollEdgeAppearance   = navigationBarAppearance
       }
    }
    
    private func applyFitsocietySegmentedControlStyle() {
        let segmentedControl  = UISegmentedControl.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        
        /// Setup the segmented control
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        segmentedControl.setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        segmentedControl.setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        segmentedControl.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
    }
    
    private func applyFitsocietySearchBarStyle() {
        let searchBar       = UISearchBar.appearance()
        let searchTextField = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        
        /// Set the tint color for all iOS versions
        searchBar.tintColor     = .white
        searchBar.barTintColor  = .white
        
        searchBar.setImage(UIImage(named: "SearchIcon"), for: .search, state: .normal)
        
        /// Set the color for the placeholder text pre iOS13
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
    }
}
