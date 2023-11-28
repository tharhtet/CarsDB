//
//  AccountViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import UIKit

class AccountViewController: BaseViewController, Storyboarded {
    
    static var storyboard: AppStoryboard = .account
    var viewModel: AccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
