//
//  GameController.swift
//  leoula
//
//  Created by Rob Zyskowski on 19/06/16.
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

class GameViewController: UIViewController {
    @IBOutlet var leButton : UIButton!
    @IBOutlet var laButton : UIButton!
    @IBOutlet var wordLabel : UILabel!
    @IBOutlet var flash : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentWord()
        styleButton(leButton)
        styleButton(laButton)

        // Do any additional setup after loading the view.
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

    func styleButton(button : UIButton) {
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 5
        button.titleEdgeInsets = UIEdgeInsets(top: 20.0, left: 30.0, bottom: 20.0, right: 30.0)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
}
