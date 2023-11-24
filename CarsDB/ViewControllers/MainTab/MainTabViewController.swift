//
//  MainTabViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/20/23.
//

import Foundation
import UIKit

class MainTabViewController: UITabBarController, Storyboarded {
    
    static var storyboard: AppStoryboard = .mainTab
    var viewModel: MainTabViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel?.initialize()
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemPink], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        tabBar.barTintColor = .white
        UITabBar.appearance().tintColor = UIColor.systemPink
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
    }
}


