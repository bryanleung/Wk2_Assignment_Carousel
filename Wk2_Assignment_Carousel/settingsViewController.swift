//
//  settingsViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/12/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 759)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closeButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressSignOutButton(sender: AnyObject) {
        var actionSheet = UIActionSheet(title: "Are you sure?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Sign Out")
        actionSheet.showInView(view)
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int){
        println(buttonIndex)
        if (buttonIndex == 0){
            performSegueWithIdentifier("signOutSegue", sender: self)
        }
    }
    
}
