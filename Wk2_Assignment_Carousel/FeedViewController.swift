//
//  FeedViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/12/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var learnMorebanner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = feedImage.frame.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressbannerCloseButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.feedImage.center.y -= 44
            self.learnMorebanner.center.y -= 44
            self.learnMorebanner.alpha = 0
        })
    }

}
