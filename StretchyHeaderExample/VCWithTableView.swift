//
//  VCWithTableView.swift
//  StretchyHeaderTableView
//
//  Created by Soso on 10/03/2020.
//  Copyright © 2020 Soso. All rights reserved.
//

import UIKit

class VCWithTableView: UIViewController {
    
    var constantHeaderHeight: CGFloat = 0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constantHeaderHeight = viewHeader.bounds.height
        tableView.delegate = self
        tableView.addSubview(viewHeader)
        tableView.contentInset = UIEdgeInsets(top: constantHeaderHeight, left: 0, bottom: 50, right: 0)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

}

extension VCWithTableView: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: scrollView.bounds.width, height: -scrollView.contentOffset.y)
        viewHeader.frame = frame
    }
}
