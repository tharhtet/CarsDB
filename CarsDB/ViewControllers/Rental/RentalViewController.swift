//
//  RentalViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import UIKit

class RentalViewController: BaseViewController, Storyboarded {
    
    static var storyboard: AppStoryboard = .rental
    var viewModel: RentalViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Rentals"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.sizeToFit()
    }
}
