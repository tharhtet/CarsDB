//
//  AccountCell.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/28/23.
//

import Foundation
import UIKit

class AccountCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    var cornerRadius: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
