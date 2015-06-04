//
//  RestaurantListViewController.swift
//  RestaurantEventBDD
//
//  Created by djzhang on 5/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class RestaurantListViewController: PFQueryTableViewController,UIScrollViewDelegate {
    
    class func instance() -> RestaurantListViewController {
        return UIStoryboard(name: "RestaurantEvent", bundle: nil).instantiateViewControllerWithIdentifier("RestaurantListViewController") as! RestaurantListViewController
    }
    var topIndexPath:NSIndexPath?
    var topHeight: CGFloat?
    
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
        
        self.view.backgroundColor = UIColor.clearColor()
        self.tableView.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: PFQueryTableViewController
    override func queryForTable() -> PFQuery{
        return ParseQueryUtils.queryRestaurant()
    }
    //MARK: UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let theIndexPath = self.topIndexPath{
            if(indexPath.section == theIndexPath.section && indexPath.row == theIndexPath.row){
                return self.topHeight!
            }
        }
        return RestaurantTableUtils.getTableCellHeight(indexPath.row, width:self.view.bounds.size.width)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    
    
    //MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.objects!.count*3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let photos:[PFObject] =  getObjects(section).valueForKey(kPAPRestaurantPhotosKey) as! [PFObject]
        
        //Count is header + map + photos(array)
        return 1 + 1 + photos.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let identify = RestaurantTableUtils.getTableCellIdentify(indexPath.row)
        var cell:ParseAbstractTableCell = self.tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as! ParseAbstractTableCell
        
        configureCell(cell, forRowAtIndexPath: indexPath)
        
        //        cell.addShadowToCellInTableView(tableView,atIndexPath:indexPath)
        
        return cell
    }
    
    
    func getObjects(section:Int) -> PFObject{
        let pfObject:[PFObject] = self.objects as! [PFObject]
        
        //        return pfObject[section]
        return pfObject[0]
    }
    
    override func objectAtIndexPath(indexPath: NSIndexPath?) -> PFObject? {
        var object = getObjects(indexPath!.section)
        
        var row:Int = indexPath!.row
        switch (row){
        case RestaurantTableRowType.UserInfo.hashValue:
            object = PFUser.currentUser()!
            break;
        case RestaurantTableRowType.RecipeLocation.hashValue:
            break;
        default:
            var photos:[PFObject]  = object.valueForKey(kPAPRestaurantPhotosKey) as! [PFObject]
            object = photos[row - 2]
            break;
        }
        
        return object
    }
    
    func configureCell(cell: ParseAbstractTableCell, forRowAtIndexPath: NSIndexPath) {
        let object: PFObject = self.objectAtIndexPath(forRowAtIndexPath)!
        cell.setCell(object)
    }
    
    // MARK: Sticky User Header view on the top of the screen
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
//        positionCells(scrollView)
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        positionCells(scrollView)
    }
    
    
    func positionCells(scrollView: UIScrollView) {
        
        let scrollOffset = scrollView.contentOffset.y
        //        println("\(scrollOffset)")
        
        println("++++++++++++++++++++")
        if let cells = self.tableView!.visibleCells() as? [ParseAbstractTableCell]{
            for cell in cells {
                println("\(cell)")
                
                let cellOffset = cell.frame.origin.y
                let headerOffset = scrollOffset - cellOffset
                if headerOffset >= 0 {
                    //                cell.headerTop?.constant = headerOffset
                } else {
                    //                cell.headerTop?.constant = 0
                }
            }
        }
        
    }
    
    
    
}
