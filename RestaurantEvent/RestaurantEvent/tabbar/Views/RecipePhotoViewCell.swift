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
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        self.opaque = false
        self.selectionStyle = .None
        self.accessoryType = .None

        self.clipsToBounds = false
        
        self.backgroundColor = UIColor.clearColor()
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: Setup table cell by object instanced PFObject
    override func setCell(object:PFObject){
        
    }
}
