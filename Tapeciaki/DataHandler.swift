//
//  DataHandler.swift
//  Tapeciaki
//
//  Created by Daniel Sadka on 02.06.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit
import Foundation

class DataHandler: NSObject  {

    var deck: Data = Data()
    
    override init(){
        super.init()
        
        let App = UIApplication.sharedApplication().delegate as! AppDelegate
        deck = App.Data_
    }
    
    func savePhoto(image: UIImage){
        /*let manager = NSFileManager.defaultManager()
        let urls = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        var finalUrl: String = ""
        if let documentDirectory: NSURL = urls.first! as NSURL {
            // This is where the database should be in the documents directory
            let Url = documentDirectory.URLByAppendingPathComponent("tapeciak.jpg")
            finalUrl = Url.path!
        }
            
        let data = UIImageJPEGRepresentation(image, 1)
        var ok = data?.writeToFile(finalUrl, atomically: true)
        print(ok)
        print("a")*/
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
}
