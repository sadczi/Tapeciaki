//
//
//  SecondViewController.swift
//  Tapeciaki
//
//  Created by Daniel Sadka on 24.05.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit
import Social

class SecondViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var spinButton: UIButton!

    @IBOutlet weak var display: UIImageView!
    fileprivate var dataHandler: DataHandler = DataHandler()
    var currentImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        dataHandler.deck.shuffle()
        currentImage = dataHandler.deck.pop()
        display.image = currentImage
        infoLabel.text = ""
        
        
    }
    


    
    @IBAction func spinAction(_ sender: AnyObject) {
        display.image = dataHandler.deck.pop()
        currentImage = display.image
        infoLabel.text = ""
    }
    
    @IBAction func saveAction(_ sender: AnyObject) {
        dataHandler.savePhoto(currentImage!)
        infoLabel.text = "Zapisano!"
    }

    @IBAction func shareAction(_ sender: AnyObject) {
        let shareController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareController.setInitialText("Mój dzisiejszy tapeciak z aplikacji \"Tapeciaki\"")
        shareController.add(currentImage)
        self.present(shareController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

