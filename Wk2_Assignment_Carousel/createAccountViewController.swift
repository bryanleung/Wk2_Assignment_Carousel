//
//  createAccountViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/12/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class createAccountViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var checkBoxchecked: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createAccountView: UIView!
    
    var originalFormsCenter: CGFloat!
    var originalButtonCenter: CGFloat!
    var screen = UIScreen.mainScreen().bounds
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBoxchecked.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalFormsCenter = scrollView.center.y
        originalButtonCenter = createAccountView.center.y
        screenHeight = screen.size.height
        
        scrollView.contentSize = CGSize(width:320, height:568)
        scrollView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didPressCheckBox(sender: AnyObject) {
        if(checkBoxchecked.hidden){
            checkBoxchecked.hidden = false
        }
        else{
            checkBoxchecked.hidden = true
        }
    }
    
    @IBAction func didPressCreateAccountButton(sender: AnyObject) {
        performSegueWithIdentifier("createAccountSegue", sender: self)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.createAccountView.center.y = self.screenHeight - kbSize.height - 30
            
            self.scrollView.center.y = 160
            
            
            }, completion: nil)
    }
    
    
    func keyboardWillHide(notification: NSNotification!) {
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            
            self.scrollView.center.y = self.originalFormsCenter
            
            self.createAccountView.center.y = self.originalButtonCenter
            
            }, completion: nil)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        
    }
    
}
