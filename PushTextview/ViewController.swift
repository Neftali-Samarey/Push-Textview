//
//  ViewController.swift
//  PushTextview
//
//  Created by Neftali Samarey on 9/1/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.asbestosColor()
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.keyboardWillHide(sender:)))
        
        self.view.backgroundColor = UIColor.cloudsColor()
        initializeTextStyling()
        textview.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func initializeTextStyling() {

        self.textview.isUserInteractionEnabled = true
        self.textview.isScrollEnabled = true
        self.textview.font = UIFont(name: "Nunito-Regular", size: 20)
        self.textview.textColor = UIColor.wetAsphaltColor()
       
        
    }
    
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.bottomConstrain.constant = 300
      //  self.textview.frame.origin.y = -150 // Move view 150 points upward
    }
    
//    @objc func keyboardWillHide(sender: NSNotification) {
//        self.view.frame.origin.y = 0 // Move view to original position
//    }
    
    
    // CONTROLS
    
    @objc func keyBoardDidShow(notification :NSNotification){
       
        if let frameObject: AnyObject = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject {
            let keyboardDimensions = frameObject.cgRectValue
            UIView.animate(withDuration: 0.3) {
                self.bottomConstrain.constant = (keyboardDimensions?.height)!
                self.textview.layoutIfNeeded()
            }
           
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.textview.resignFirstResponder()
            self.bottomConstrain.constant = 10
            self.textview.layoutIfNeeded()
        }
    }


}

