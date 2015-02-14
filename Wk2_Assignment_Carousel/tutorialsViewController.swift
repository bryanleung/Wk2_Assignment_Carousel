//
//  tutorialsViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/12/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class tutorialsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width:1280, height: 568)
        scrollView.delegate = self
        buttonContainer.alpha = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        var page = Int(scrollView.contentOffset.x / 320)
        pageControl.currentPage = page
        if(page + 1 == 4){
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.buttonContainer.alpha = 1
            })
        }
        else{
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.buttonContainer.alpha = 0
            })
        }
    }
    
    @IBAction func didPressTakeASpin(sender: AnyObject) {
        performSegueWithIdentifier("takeASpin", sender: self)
    }

    
}
