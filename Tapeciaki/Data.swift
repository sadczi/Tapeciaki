//
//  Data.swift
//  Tapeciaki
//
//  Created by Daniel Sadka on 25.05.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class Data: NSObject {
    
    var photos: [UIImage] = []
    

    override init(){
        super.init()
        
        for index in 1...59{
            photos.append(UIImage(named: "img\(index)")!)
        }
    }
    
    func shuffle(){
        self.photos.shuffleInPlace()
    }
    
    func pop() -> UIImage {
        if photos.count == 0 {
            let emptyImage = UIImage()
            return emptyImage
        }
        return photos.popLast()!
    }
}
