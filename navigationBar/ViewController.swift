//
//  ViewController.swift
//  navigationBar
//
//  Created by Wouter van de Kamp on 24/09/2019.
//  Copyright © 2019 Wouter van de Kamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
//        setupSegmentedControl()
    }
    
    private func setupNavigationBar() {
        let searchController = UISearchController(searchResultsController: nil)
        
        /// Add segmented control
        searchController.searchBar.scopeButtonTitles = ["Nearby", "Anywhere"]
        
        searchController.searchBar.delegate = self
        
        /// Everything related to the large title and making it work.
        navigationController?.navigationBar.prefersLargeTitles  = true
        extendedLayoutIncludesOpaqueBars                        = true
        definesPresentationContext                              = true
        
        /// Set the navigationitem title first before setting the searchcontroller.
        /// Otherwise in iOS12 you are losing your title. In iOS13 this behaves correctly.
        navigationItem.title                        = "Title"
        navigationItem.searchController             = searchController
        navigationItem.hidesSearchBarWhenScrolling  = false
        
        /// Set styling on the searchbar input for iOS13
        /// Generic styling does not work through `appearance()`
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.textColor        = .white
            searchController.searchBar.searchTextField.backgroundColor  = UIColor.darkGray.withAlphaComponent(0.5)
        } else {
            /// We need to set the bar styling prior to iOS13 with a custom extension
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("text changing")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Stopped editting")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Begin")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancelled")
    }
}
