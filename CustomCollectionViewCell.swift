//
//  CustomCollectionViewCell.swift
//  SwiftTableView
//
//  Created by Ishani on 9/27/15.
//  Copyright (c) 2015 Ishani. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.addSubview(cellImage)
        self.contentView.addSubview(cellLabel)
    }
    

}
