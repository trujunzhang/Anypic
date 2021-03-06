//
//  RestaurantCollectionViewController.swift
//  RestaurantEvent
//
//  Created by djzhang on 6/3/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import UIKit

class RestaurantCollectionViewController : PFQueryCollectionViewController,UIScrollViewDelegate{
    lazy var headerNib:UINib = {
        return UINib(nibName: "CSAlwaysOnTopHeader", bundle: nil)
        }()
    
    class func instance() -> RestaurantCollectionViewController {
        return UIStoryboard(name: "RestaurantEvent", bundle: nil).instantiateViewControllerWithIdentifier("RestaurantCollectionViewController") as! RestaurantCollectionViewController
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.clearColor()
        self.collectionView!.backgroundColor = UIColor.clearColor()
        
        self.collectionView?.registerNib(self.headerNib, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: "CSStickyHeader")
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
        
        
        
        
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        reloadLayout()
    }
    
    func reloadLayout(){
        let layout: CSStickyHeaderFlowLayout = self.collectionViewLayout as! CSStickyHeaderFlowLayout
        
        layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 426)
        layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(self.view.frame.size.width, 110)
        layout.itemSize = CGSizeMake(self.view.frame.size.width, layout.itemSize.height)
        layout.parallaxHeaderAlwaysOnTop = true
        
        // If we want to disable the sticky header effect
        layout.disableStickyHeaders = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: PFQueryTableViewController
    override func queryForCollection() -> PFQuery{
        return ParseQueryUtils.queryRestaurant()
    }
    
    
    
    //MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.objects.count*3
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let photos:[PFObject] =  getObjects(section).valueForKey(kPAPRestaurantPhotosKey) as! [PFObject]
        
        //Count is header + map + photos(array)
        return 1 + 1 + photos.count
    }
    
    //    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFCollectionViewCell? {
    //
    //        let identify = RestaurantTableUtils.getTableCellIdentify(indexPath.row)
    //
    //        var cell:ParseAbstractTableCell = self.collectionView?.dequeueReusableCellWithReuseIdentifier(identify, forIndexPath: indexPath) as! ParseAbstractTableCell
    //
    //        configureCell(cell, forRowAtIndexPath: indexPath)
    //
    //        return cell
    //    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var reusableView: UICollectionReusableView? = nil
        
        if kind == CSStickyHeaderParallaxHeader {
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CSStickyHeader", forIndexPath: indexPath) as! UICollectionReusableView
        }else if kind == UICollectionElementKindSectionHeader {
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "sectionHeader", forIndexPath: indexPath) as! UICollectionReusableView
        }
        
        return reusableView!
    }
    
    
    //MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
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
        positionCells(scrollView)
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        positionCells(scrollView)
    }
    
    func positionCells(scrollView: UIScrollView) {
        
        let scrollOffset = scrollView.contentOffset.y
        //        println("\(scrollOffset)")
        
        println("++++++++++++++++++++")
        if let cells = self.collectionView!.visibleCells() as? [ParseAbstractTableCell]{
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
