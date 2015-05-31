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
    
    
    // MARK: Setup table cell by object instanced PFObject
    override func setCell(object:PFObject){
        
    }
}
