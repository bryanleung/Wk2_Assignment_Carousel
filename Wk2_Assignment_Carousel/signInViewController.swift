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
    var originalInputFormsCenter: CGFloat!
    var screen = UIScreen.mainScreen().bounds
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputFormsContainer.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        scrollView.contentSize = CGSize(width:320, height:500)
        scrollView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalScrollViewCenter = scrollView.center.y

        originalSignInCenter = signInButtonsContainer.center.y
        originalInputFormsCenter = inputFormsContainer.center.y
        screenHeight = screen.size.height
        
        UIView.animateWithDuration(0.8, animations: { () -> Void in
            self.inputFormsContainer.alpha = 1
            self.inputFormsContainer.transform = CGAffineTransformMakeScale(1, 1)
        })
        
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
            
            //println(kbSize.height)
            self.scrollView.contentSize = CGSize(width:320, height:504)
            //self.scrollView.center.y = 130
            self.signInButtonsContainer.center.y = self.screenHeight - kbSize.height - 125
            self.inputFormsContainer.center.y = 50
            
            
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
            
            self.scrollView.contentSize = CGSize(width:320, height:500)
            //self.scrollView.frame.inset(dx: 0, dy: 0)
            self.scrollView.center.y = self.originalScrollViewCenter
            
            self.signInButtonsContainer.center.y = self.originalSignInCenter
            self.inputFormsContainer.center.y = self.originalInputFormsCenter
            
            }, completion: nil)
        
    }

}
