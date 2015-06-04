//
//  UserHeaderViewCell.swift
//  RestaurantEventBDD
//
//  Created by djzhang on 5/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class UserHeaderViewCell: ParseAbstractTableCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.titleLabel.font = UIFont.applicationUserTitleFont()
//        self.detailLabel.font = UIFont.applicationUserDetailFont()
    }
    
    // MARK: Setup table cell by object instanced PFObject
    override func setCell(object:PFObject){
      let displayName =  "Trujun Zhang" //object.valueForKey(kPAPUserDisplayNameKey) as! String
      let timeAgo =  "40 minutes ago"
        
        titleLabel.text = displayName
        detailLabel.text = timeAgo
    }

}
