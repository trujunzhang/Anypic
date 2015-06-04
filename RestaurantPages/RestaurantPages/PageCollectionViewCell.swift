//
//  PageCollectionViewCell.swift
//  RestaurantPages
//
//  Created by djzhang on 6/4/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //        self.titleLabel.font = UIFont.applicationUserTitleFont()
        //        self.detailLabel.font = UIFont.applicationUserDetailFont()
    }
    
    func configureCell(row:Int){
        let name = "recipe0\(row).jpg"
        let image:UIImage = UIImage(named: name)!
        
        self.photoImageView.image = image
    }
    
}
