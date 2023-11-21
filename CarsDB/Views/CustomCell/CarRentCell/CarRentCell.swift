//
//  CarRentCell.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/20/23.
//

import Foundation
import UIKit

class CarRentCell: UITableViewCell {
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var mileLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with row: VehicleModel, index: Int) {
        carImageView.image = UIImage(named: "\(index)")
        titleLabel.text = "\(row.make) \(row.model)"
        priceLabel.text = "\(row.yousavespend)"
        mileageLabel.text = "\(row.hlv)"
    }
}
