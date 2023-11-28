//
//  CarDetailViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/23/23.
//

import Foundation
import UIKit

class CarDetailViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var carHeightConstraint: NSLayoutConstraint!
    
    static var storyboard: AppStoryboard = .carDetail
    var viewModel: CarDetailViewModel?
    let arr: [[String]] = [["AUX/MP3 enabled", "Air conditioning"], ["Bluetooth wireless", "Cruise control"], ["Front Wheel Drives", "Power windows"], ["Automatic Transmit"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
        self.setUpBindings()
    }
    
    func configUI() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName: "CarTabCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CarTabCell")
        orderButton.layer.cornerRadius = 8
    }
    
    private func setUpBindings() {
        guard let viewModel = viewModel else { return }
        let data = viewModel.vehicle
        if let make = data?.make, let model = data?.model {
            self.titleLabel.text = "\(make)\(model)"
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        viewModel?.didTapBackAction()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerView" {
            let vc = segue.destination as! SliderViewController
            let viewModel1 = DetailSliderViewModel()
            viewModel1.vehicle = viewModel?.vehicle
            vc.viewModel = viewModel1
        }
    }
}

extension CarDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarTabCell", for: indexPath) as! CarTabCell
        cell.selectionStyle = .none
        let dd = arr[indexPath.row]
        cell.titleLabel.text = arr[indexPath.row][0]
        if dd.count > 1 {
            cell.titleLabel1.text = arr[indexPath.row][1]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

