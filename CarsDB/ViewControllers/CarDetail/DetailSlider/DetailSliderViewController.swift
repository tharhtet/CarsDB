//
//  DetailSliderViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/24/23.
//

import Foundation
import UIKit

class SliderViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var viewModel: DetailSliderViewModel?
    static var storyboard: AppStoryboard = .carDetail
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setUpBindings()
    }
    
    func configUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "SliderCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SliderCell")
        
        self.imageView.layer.cornerRadius = self.imageView.frame.width / 2
    }
    
    private func setUpBindings() {
        guard let viewModel = viewModel else { return }
        let data = viewModel.vehicle
        if let make = data?.make, let model = data?.model, let year = data?.year {
            self.titleLabel.text = "\(year) \(make) \(model)"
        }
        self.pageControl.numberOfPages = 3
    }
    
    func scrollToCollectionView(page: Int) {
        self.pageControl.currentPage = page
        let indexPath = IndexPath(row: page, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}

extension SliderViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        cell.imageView.image = UIImage(named: "1")
        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 200)
    }
}
