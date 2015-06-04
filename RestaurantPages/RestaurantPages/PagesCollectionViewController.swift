//
//  PagesCollectionViewController.swift
//  RestaurantPages
//
//  Created by djzhang on 6/4/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

let reuseIdentifier = "PageCollectionViewCell"

class PagesCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate {
    
    @IBOutlet var collectionPanGesture: UIPanGestureRecognizer!
    
    
    class func instance() -> PagesCollectionViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PagesCollectionViewController") as! PagesCollectionViewController
    }
    
    //    -(void)setupCollectionView {
    //    [self.collectionView registerClass:[CMFGalleryCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    //
    //    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //    [flowLayout setMinimumInteritemSpacing:0.0f];
    //    [flowLayout setMinimumLineSpacing:0.0f];
    //    [self.collectionView setPagingEnabled:YES];
    //    [self.collectionView setCollectionViewLayout:flowLayout];
    //    }
    
    func setupCollectionView(){
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        
//        self.collectionView?.pagingEnabled = true
        self.collectionView?.collectionViewLayout = flowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.registerClass(PageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        setupCollectionView()
        
        self.collectionPanGesture.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 4
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        
        // Configure the cell
        var pageCell:PageCollectionViewCell = cell as! PageCollectionViewCell
        pageCell.configureCell(indexPath.row+1)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath section: NSIndexPath) -> CGSize {
        
        let height = self.collectionView?.frame.size.height
        // 560/350
        let width = height!/350*560
        return CGSizeMake(width, height!)
    }
    
    
    //    -(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    return self.collectionView.frame.size;
    //    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    
    //        CGFloat new_size;
    //        if (self.pinchRecognizer.scale < 1.0) {
    //            new_size = self.frame.size.width + (self.pinchRecognizer.velocity / self.pinchRecognizer.scale);
    //        } else {
    //
    //            new_size = self.frame.size.width + self.pinchRecognizer.velocity;
    //        }
    //
    //        CGFloat delta = (self.frame.size.width - new_size)/2;
    //        self.frame = CGRectMake(self.frame.origin.x + delta, self.frame.origin.y + delta, new_size, new_size);
    
    
    // MARK: Pinch gesture recognizer for CollectionView
    @IBAction func handlePinch(recognizer: UIPinchGestureRecognizer) {
        var new_size:CGFloat
        if(recognizer.scale < 1.0){
            new_size = recognizer.velocity/recognizer.scale
        }else{
            new_size = recognizer.velocity
        }
        //        var delta:CGFloat = new_size
        
        println("scale is \(recognizer.scale), velocity is \(recognizer.velocity)")
    }
    
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        let x = 0

    }
    
    // MARK: UIGestureRecognizerDelegate
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool{
        
        
        return false
    }
    
    
}
