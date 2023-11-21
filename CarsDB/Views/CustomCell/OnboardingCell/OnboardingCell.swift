//
//  OnboardingCell.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/17/23.
//

import Foundation
import UIKit
import Lottie

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: LottieAnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with slide: SlideModel) {
        print(slide.image ?? "image1")
        titleLabel.text = slide.title ?? ""
        descLabel.text = slide.desc ?? ""
        
        imageView.loopMode = .loop
        imageView.contentMode = .scaleAspectFill
        imageView.animation = LottieAnimation.named(slide.image ?? "image1")
        imageView.play()
        
    }
}
