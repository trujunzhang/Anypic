//
//  RecipePhotoViewController.swift
//  RestaurantPages
//
//  Created by djzhang on 6/5/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit

class RecipePhotoViewController: UIViewController {
    class func instance() -> RecipePhotoViewController {
        return UIStoryboard(name: "CollectionViews", bundle: nil).instantiateViewControllerWithIdentifier("RecipePhotoViewController") as! RecipePhotoViewController
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureCell(row:Int){
        let name = "recipe0\(row).jpg"
        let image:UIImage = UIImage(named: name)!
        
        self.photoImageView.image = image
    }


}
