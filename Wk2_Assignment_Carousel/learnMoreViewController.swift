//
//  learnMoreViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/14/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class learnMoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPresscloseButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
