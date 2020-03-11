//
//  VCWithCollectionView.swift
//  StretchyHeaderTableView
//
//  Created by Soso on 10/03/2020.
//  Copyright © 2020 Soso. All rights reserved.
//

import UIKit

class VCWithCollectionView: UIViewController {
    
    var constantHeaderHeight: CGFloat = 0

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constantHeaderHeight = viewHeader.bounds.height
        collectionView.delegate = self
        collectionView.addSubview(viewHeader)
        collectionView.contentInset = UIEdgeInsets(top: constantHeaderHeight, left: 0, bottom: 50, right: 0)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

}

extension VCWithCollectionView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: scrollView.bounds.width, height: -scrollView.contentOffset.y)
        viewHeader.frame = frame
    }
}
