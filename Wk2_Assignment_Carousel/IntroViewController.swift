//
//  IntroViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/12/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introTile1: UIImageView!
    @IBOutlet weak var introTile2: UIImageView!
    @IBOutlet weak var introTile3: UIImageView!
    @IBOutlet weak var introTile4: UIImageView!
    @IBOutlet weak var introTile5: UIImageView!
    @IBOutlet weak var introTile6: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width:320, height:1136)
        scrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        //This method is called as the user scrolls
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // called when scroll view grinds to a halt
    }
    

    
}
