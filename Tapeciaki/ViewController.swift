//
//  ViewController.swift
//  Tapeciaki
//
//  Created by Daniel Sadka on 24.05.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var TapeciakiTitleLabel: UILabel!
    @IBOutlet weak var segueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
    }

    @IBAction func buttonClicked(sender: AnyObject) {
        performSegueWithIdentifier("MainSegue", sender: sender)
    }
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

