//
//  RestaurantListViewController.swift
//  RestaurantEventBDD
//
//  Created by djzhang on 5/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class RestaurantListViewController: PFQueryTableViewController {
    
    class func instance() -> RestaurantListViewController {
        return UIStoryboard(name: "RestaurantEvent", bundle: nil).instantiateViewControllerWithIdentifier("RestaurantListViewController") as! RestaurantListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Restaurant List"
        
        
        // The className to query on
        self.parseClassName = kPAPPhotoClassKey
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = true
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = true
        
        // The number of objects to show per page
        // self.objectsPerPage = 10;
        
        // Improve scrolling performance by reusing UITableView section headers
        //        self.reusableSectionHeaderViews = [NSMutableSet setWithCapacity:3];
        
        // The Loading text clashes with the dark Anypic design
        self.loadingViewEnabled = true
        
        tableView.registerClass(PFTableViewCell.self, forCellReuseIdentifier: "ParseCell")
        //        tableView.registerNib(UINib(nibName: "CatsTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: PFQueryTableViewController
    override func queryForTable() -> PFQuery{
        return QueryRestaurantUtils.query()
    }
    
    //MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.objects!.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let pfObjects:[PFObject] = self.objects as! [PFObject]
        let object:PFObject = pfObjects[section]
        
        let photos:[PFObject] =  object.valueForKey(kPAPRestaurantPhotosKey) as! [PFObject]
        
        // header + map + photos(array)
        return 1 + 1 + photos.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        var cell:PFTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("ParseCell", forIndexPath: indexPath) as! PFTableViewCell
        
        configureCell(cell, forRowAtIndexPath: indexPath)
        
        return cell
    }
    
    //    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
    //        configureCell(cell, forRowAtIndexPath: indexPath)
    //        return cell
    //    }
    
    func configureCell(cell: PFTableViewCell, forRowAtIndexPath: NSIndexPath) {
        let object: PFObject = self.objectAtIndexPath(forRowAtIndexPath)!
        cell.textLabel?.text = object.objectForKey(kPAPRestaurantWaiterKey) as! String
    }
    
    
}
