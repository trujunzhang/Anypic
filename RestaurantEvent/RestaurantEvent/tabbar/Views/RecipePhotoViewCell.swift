//
//  RecipePhotoViewCell.swift
//  RestaurantEventBDD
//
//  Created by djzhang on 5/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class RecipePhotoViewCell: ParseAbstractTableCell {
    
    @IBOutlet weak var photoContainer: UIView!
    @IBOutlet weak var photoButton: UIButton!
    
    lazy var photoView:PFImageView = { return PFImageView() }()
    var photo:PFObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupTableCell()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: Setup table cell
    func setupTableCell(){
        // Initialization code
        self.opaque = false
        self.selectionStyle = .None
        self.accessoryType = .None
        
        self.clipsToBounds = false
        
        self.backgroundColor = UIColor.clearColor()
        
        // Initialization for PhotoView.
        self.photoView.backgroundColor = UIColor.blackColor()
        self.photoView.contentMode = .ScaleAspectFit
        
        self.photoContainer.addSubview(self.photoView)
        self.photoView.LayoutFullView()
        
        self.photoView.image = UIImage(named: "PlaceholderPhoto.png")
        
        // Initialization for PhotoButton.
        self.photoButton.backgroundColor = UIColor.clearColor()
    }
    
    // MARK: Configure table cell by object instanced PFObject
    override func setCell(_photo:PFObject){
        if let thePhoto = self.photo{
            showRemoteImage()
        } else {
            loadingPhotoObject(_photo)
        }
    }
    
    func loadingPhotoObject(_photo:PFObject){
        ParseQueryUtils.queryPhoto(_photo, completionBlock: { (result) -> Void in
            switch(result){
            case .Failure:
                let x = 0
                break;
            case .Success:
                if let theValue = result.value{
                    self.photo = theValue as PFObject
                    self.showRemoteImage()
                }
                break;
            }
        })
    }
    
    func showRemoteImage(){
        // PFQTVC will take care of asynchronously downloading files, but will only load them when the tableview is not moving. If the data is there, let's load it right away.
        if let thePhoto = self.photo{
            let photoFile: PFFile = thePhoto.valueForKey(kPAPPhotoPictureKey) as! PFFile
            photoView.file = photoFile
            photoView.loadInBackground()
            
            if let theFile = photoView.file{
                if(theFile.isDataAvailable == true){
                    photoView.loadInBackground()
                }
            }
        }
        
    }
}
