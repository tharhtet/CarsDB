//
//  ConfirmController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 12/8/23.
//

import Foundation
import UIKit

class ConfirmController: BaseViewController, Storyboarded {
    
    static var storyboard: AppStoryboard = .prompt
    var viewModel: ConfirmViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
