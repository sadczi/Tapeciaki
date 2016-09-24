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

class SecondViewController: UIViewController , UINavigationControllerDelegate{
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var display: UIImageView!
    fileprivate var dataHandler: DataHandler = DataHandler()
    var currentImage: UIImage?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        //taking screen width and height into variables
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        //setting image display so it fits to screen bounds
        display.center = self.view.center
        display.bounds.size.width = 7/8 * width
        display.bounds.size.height = 2/3 * height
        display.center.y -= 1/8 * height
        
        //values made to help possition buttons on screen
        let buttonsYCoordinates = UIScreen.main.bounds.maxY - (UIScreen.main.bounds.maxY - display.bounds.maxY) * 2/3
        let shareButtonYCoordinates = UIScreen.main.bounds.maxY - (UIScreen.main.bounds.maxY - display.bounds.maxY) * 1/3
        let forthPartOfDisplaysWidth = width / 4
        
        //possitioning buttons on screen
        spinButton.center.y = buttonsYCoordinates
        saveButton.center.y = buttonsYCoordinates
        shareButton.center.y = shareButtonYCoordinates
        
        spinButton.center.x = forthPartOfDisplaysWidth * 3
        saveButton.center.x = forthPartOfDisplaysWidth
        shareButton.center.x = self.view.center.x
        
        //Intuitional guest recognizing for spin action
        let swipe = UISwipeGestureRecognizer(target: self , action: #selector(SecondViewController.RespondToSwipe))
        swipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipe)
        
        
        //rest of initialisation
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        dataHandler.deck.shuffle()
        currentImage = dataHandler.deck.pop()
        display.image = currentImage
        infoLabel.center.y = shareButton.center.y + shareButton.bounds.height
        infoLabel.center.x = shareButton.center.x
        infoLabel.text = ""
        
        
        
    }
    func RespondToSwipe(){
        display.image = dataHandler.deck.pop()
        currentImage = display.image
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

