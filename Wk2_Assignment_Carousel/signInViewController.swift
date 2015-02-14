//
//  signInViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/12/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class signInViewController: UIViewController, UIAlertViewDelegate, UIScrollViewDelegate {


    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signInButtonsContainer: UIView!
    @IBOutlet weak var inputFormsContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var originalScrollViewCenter: CGFloat!
    var originalSignInCenter: CGFloat!
    //var originalInputFormsCenter: CGFloat!
    var screen = UIScreen.mainScreen().bounds
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width:320, height:568)
        scrollView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalScrollViewCenter = scrollView.center.y

        originalSignInCenter = signInButtonsContainer.center.y
        //originalInputFormsCenter = inputFormsContainer.center.y
        screenHeight = screen.size.height
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func didPressSignInButton(sender: AnyObject) {
        var alertViewEmptyEmail = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
        var alertViewWrongPW = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
        
        if(emailTextField.text == "email" && passwordTextField.text == "password"){
            checkPassword()
            delay(2, { () -> () in
                self.performSegueWithIdentifier("signInSegue", sender: self)
            })
            
        }
        else if(emailTextField.text.isEmpty || passwordTextField.text.isEmpty){
            alertViewEmptyEmail.show()
        }
        else{
            loadingIndicator.startAnimating()
            checkPassword()
            delay(2, { () -> () in
                alertViewWrongPW.show()
                self.loadingIndicator.stopAnimating()
            })
        }
    }
    
    func checkPassword(){
        var alertViewCheckPassword = UIAlertView(title: "Signing In...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertViewCheckPassword.show()
        delay(2, { () -> () in
            alertViewCheckPassword.dismissWithClickedButtonIndex(0, animated: true)
        })
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
            
            //self.scrollView.contentSize = CGSize(width:320, height:268)
            self.scrollView.center.y -= 100
            self.signInButtonsContainer.center.y = self.signInButtonsContainer.center.y - kbSize.height + 70
            //self.inputFormsContainer.center.y = self.signInButtonsContainer.center.y - 160
            
            
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
            
            self.scrollView.center.y = self.originalScrollViewCenter
            
            self.signInButtonsContainer.center.y = self.originalSignInCenter
            //self.inputFormsContainer.center.y = self.originalInputFormsCenter
            
            }, completion: nil)
        
    }

}
