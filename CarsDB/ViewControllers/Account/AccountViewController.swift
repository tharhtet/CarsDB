//
//  AccountViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import UIKit
import Firebase
import MBProgressHUD

class AccountViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    static var storyboard: AppStoryboard = .account
    var viewModel: AccountViewModel?
    
    let data: [[String]] = [[""], ["Profile", "Payments", "Payment methods"], ["Help center", "Contact CarLite", "Rate on App Store", "Invite friends"], ["Log out"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Account"
        configUI()
    }
    
    func configUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "AccountCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "AccountCell")
        let verifyNib = UINib(nibName: "VerifyCell", bundle: nil)
        self.tableView.register(verifyNib, forCellReuseIdentifier: "VerifyCell")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.sizeToFit()
    }
}

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let verifyCell = tableView.dequeueReusableCell(withIdentifier: "VerifyCell", for: indexPath) as! VerifyCell
            verifyCell.selectionStyle = .none
            return verifyCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
            cell.selectionStyle = .none
            cell.imgView.image = UIImage(named: "\(indexPath.section)\(indexPath.row)")
            cell.titleLabel.text = data[indexPath.section][indexPath.row]
            cell.lineView.isHidden = indexPath.row == (data[indexPath.section].count - 1)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            viewModel?.didTapMenuAction()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if section == 3 {
//            return 40.0
//        } else {
//            return 18.0
//        }
        return 18.0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == 3 {
//            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
//            let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
//            label.text = "Version 1.0.0 (01)"
//            label.font = .systemFont(ofSize: 13)
//            label.textAlignment = .center
//            footerView.addSubview(label)
//            return footerView
//        } else {
//            return UIView()
//        }
        return UIView()
    }
}
