//
//  ViewController.swift
//  leoula
//
//  Created by Rob Zyskowski on 18/06/16.
//  Copyright © 2016 Rob Zyskowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        let SearchController: SearchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        let GameController: GameViewController = GameViewController(nibName: "GameViewController", bundle: nil)

        self.addChildViewController(SearchController)
        self.scrollView.addSubview(SearchController.view)
        SearchController.didMoveToParentViewController(self)

        self.addChildViewController(GameController)
        self.scrollView.addSubview(GameController.view)
        GameController.didMoveToParentViewController(self)

        var SearchViewFrame : CGRect = SearchController.view.frame
        SearchViewFrame.origin.x = self.view.frame.width
        SearchController.view.frame = SearchViewFrame

        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 2, self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
