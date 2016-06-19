//
//  ViewController.swift
//  leoula
//
//  Created by Rob Zyskowski on 18/06/16.
//  Copyright © 2016 Rob Zyskowski. All rights reserved.
//

import UIKit
let word = Word()

extension UIView {
    func flashRed() {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.backgroundColor = UIColor.redColor()
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.backgroundColor = UIColor.whiteColor()
            }, completion: nil)
    }

    func flashGreen() {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.backgroundColor = UIColor.greenColor()
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.backgroundColor = UIColor.whiteColor()
            }, completion: nil)
    }
}

class ViewController: UIViewController {
    @IBOutlet var leButton : UIButton!
    @IBOutlet var laButton : UIButton!
    @IBOutlet var wordLabel : UILabel!
    @IBOutlet var flash : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayCurrentWord()

        leButton.backgroundColor = UIColor.clearColor()
        leButton.layer.cornerRadius = 5
        leButton.titleEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        leButton.layer.borderWidth = 1
        leButton.layer.borderColor = UIColor.blackColor().CGColor

        laButton.backgroundColor = UIColor.clearColor()
        laButton.layer.cornerRadius = 5
        laButton.titleEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        laButton.layer.borderWidth = 1
        laButton.layer.borderColor = UIColor.blackColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leTapped(sender : AnyObject) {
        let success: Bool = word.currentGender == "le"
        showFlash(success)

        word.setCurrentWord()
        displayCurrentWord()
    }

    @IBAction func laTapped(sender : AnyObject) {
        let success: Bool = word.currentGender == "la"
        showFlash(success)

        word.setCurrentWord()
        displayCurrentWord()
    }

    func displayCurrentWord() {
        wordLabel.text = word.currentWord
        wordLabel.textAlignment = .Center
    }

    func showFlash(success : Bool) {
        if (success) {
            flash.flashGreen()
        } else {
            flash.flashRed()
        }
    }
}
