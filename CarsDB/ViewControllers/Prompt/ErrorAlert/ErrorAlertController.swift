//
//  ErrorAlertController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 12/8/23.
//

import Foundation
import UIKit

class ErrorAlertController: BaseViewController, Storyboarded {
    
    static var storyboard: AppStoryboard = .prompt
    var viewModel: ErrorAlertViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
