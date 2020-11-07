//
//  MovingCircle.swift
//  Animation
//
//  Created by Mazal Zhou on 2020-11-06.
//  Copyright © 2020 Royal St. George's College. All rights reserved.
//

import Foundation

// A class is just a container that stores:
// - state (information / data \)
// - behaviours (methods / functions that make something happen)
class MovingCircle {
    
    // 1. Properties ( the state)
    
    var x: Int
    var y: Int
    
    var dx: Int
    var dy: Int
    
    var diameter: Int
    
    // 2. Initializer (initialize, or "set up" the properties with a first value)
    
    init(x: Int, y: Int, dx: Int, dy: Int, diameter: Int) {
        
        
        
        // "self" refers to the properties from THIS class
        // light blue refers to the property
        // white refers to the local prameter value
        self.x = x
        self.y = y
        self.dx = dx
        self.dy = dy
        self.diameter = diameter
    }
    
    // 3. Methods (make things happen)
    
}
