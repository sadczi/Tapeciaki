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
        
        let App = UIApplication.shared.delegate as! AppDelegate
        deck = App.Data_
    }
    
    func savePhoto(_ image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
}
