//
//  HomeViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation
import UIKit
import Alamofire

class HomeViewController: BaseViewController, Storyboarded {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorIcon: UIActivityIndicatorView!
    
    static var storyboard: AppStoryboard = .home
    var viewModel: HomeViewModel?
    var results: [VehicleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
        self.setUpBindings()
    }
    
    private func configUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.contentInset = UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0);
        let nib = UINib(nibName: "CarRentCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CarRentCell")
    }
    
    private func setUpBindings() {
        //guard let viewModel = viewModel else { return }
        CarServices.shared.fetchCarLists { result in
            self.results = result
            self.indicatorIcon.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarRentCell", for: indexPath) as! CarRentCell
        let index = indexPath.row
        cell.configure(with: self.results[index], index: index)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
