//
//  MutableCollectionType + shuffleInPlace.swift
//  Tapeciaki
//
//  Created by Daniel Sadka on 02.06.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import Foundation

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}