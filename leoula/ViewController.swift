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
    func fadeIn() {
        // Move our fade out code from earlier
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
            }, completion: nil)
    }

    func fadeOut() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: nil)
    }
}

class ViewController: UIViewController {
    @IBOutlet var leButton : UIButton!
    @IBOutlet var laButton : UIButton!
    @IBOutlet var textView : UITextView!
    @IBOutlet var flash : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayCurrentWord()
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
        textView.text = word.currentWord
    }

    func showFlash(success : Bool) {
        if (success) {
            flash.textColor = UIColor.greenColor()
            flash.text = "oui!"
        } else {
            flash.textColor = UIColor.redColor()
            flash.text = "non!"
        }
        flash.fadeIn()
        flash.fadeOut()
    }
}
