//
//  CarDetailViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/23/23.
//

import Foundation
import UIKit

class CarDetailViewController: BaseViewController, Storyboarded {
    
    static var storyboard: AppStoryboard = .carDetail
    var viewModel: CarDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
