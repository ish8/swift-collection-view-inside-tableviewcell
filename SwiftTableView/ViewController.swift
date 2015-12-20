//
//  ViewController.swift
//  SwiftTableView
//
//  Created by Ishani on 9/26/15.
//  Copyright (c) 2015 Ishani. All rights reserved.

//This UITableView has custom UITableviewcell which contain a collectionview inside it 
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var dashboardTableView: UITableView!
    var dashboardcellData :[String] = ["Row 1 without collectionView","Row 2 without collection view"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //for custom cell
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        dashboardTableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        
        //for normal cell
        self.dashboardTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellnormal")
        
        self.navigationItem.title = "Title"
        
        let leftBarButton: UIButton = UIButton()
        leftBarButton.setImage(UIImage(named: "back_arrow"), forState: .Normal)
        leftBarButton.frame = CGRectMake(0, 0, 30, 30)
        leftBarButton.addTarget(self, action: Selector("action"), forControlEvents: .TouchUpInside)
        
        //.... Set Right/Left Bar Button item
        let leftButtonButtonItem:UIBarButtonItem = UIBarButtonItem()
        leftButtonButtonItem.customView = leftBarButton
        self.navigationItem.leftBarButtonItem = leftButtonButtonItem
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }
    
    func sizeHeaderToFit() {
        let headerFrame : CGRect = CGRectMake(0, 0, dashboardTableView.frame.size.width, 200)
       // let headerView : DashBoardHeaderView = DashBoardHeaderView()
        let imageView : UIImageView = UIImageView()
        imageView.image = UIImage(named: "blue_bg_image")
        imageView.frame = headerFrame
        imageView.frame = headerFrame
        dashboardTableView.tableHeaderView = imageView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         if(indexPath.section != 3)
         {
            let cell : UITableViewCell = self.dashboardTableView.dequeueReusableCellWithIdentifier("cell")!
            
            //cell.textLabel?.text = dashboardcellData[indexPath.row]
            
            return cell;
        }
        else
         {
            let cellnormal : UITableViewCell = self.dashboardTableView.dequeueReusableCellWithIdentifier("cellnormal")!
            
            cellnormal.textLabel?.text = dashboardcellData[indexPath.row]
            return cellnormal;
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section != 3)
        {
           return 1;
        }
        else
        {
            return dashboardcellData.count
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section != 3)
        {
            return "sectionheader"
  
        }
        return nil;
    }
    
     func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if(section != 3)
        {
            let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
            header.contentView.backgroundColor = UIColor(red: 0/255, green: 181/255, blue: 229/255, alpha: 1.0) //make the background color light blue
            header.textLabel?.textColor = UIColor.whiteColor() //make the text white
            header.alpha = 0.5 //make the header transparent

            
        }
    }
    
    func action()
    {
        print("back arrow clicked")
    }

}

