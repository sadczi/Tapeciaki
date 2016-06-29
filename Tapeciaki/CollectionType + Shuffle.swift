//
//  CollectionType + Shuffle.swift
//  Tapeciaki
//
//  Created by Daniel Sadka on 02.06.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import Foundation

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}