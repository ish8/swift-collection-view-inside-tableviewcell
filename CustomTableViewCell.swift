//
//  CustomTableViewCell.swift
//  SwiftTableView
//
//  Created by Ishani on 9/26/15.
//  Copyright (c) 2015 Ishani. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myCollectionView: UICollectionView!
    //var collectionViewCell : CustomCollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //layout.itemSize = CGSize(width: 91, height: 105)
       // myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        //myCollectionView!.dataSource = self
        //myCollectionView!.delegate = self
       // myCollectionView!.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        myCollectionView!.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        
        
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        myCollectionView.registerNib(nib, forCellWithReuseIdentifier: "cell1")
        
        //myCollectionView!.backgroundColor = UIColor.whiteColor()
        //self.contentView.addSubview(myCollectionView!)
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    //collectionview delegate methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell :CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.grayColor()
        //cell.cellLabel?.text = "\(indexPath.section):\(indexPath.row)"
        cell.cellLabel?.text = "Cell \(indexPath.row)"
        cell.cellImage?.image = UIImage(named: "Heat@2x")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("hello")
    }
    
        
    
    
    
}


