//
//  MovingCircle.swift
//  Animation
//
//  Created by Mazal Zhou on 2020-11-06.
//  Copyright © 2020 Royal St. George's College. All rights reserved.
//

import Foundation
import CanvasGraphics

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
    
    // Computed property
    var radius: Int {
        return self.diameter / 2
    }
    
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
    
    func update(on canvas: Canvas){
        
        // Move the circle
        
        x += dx
        y += dy
        
        // Set circle colors
        
        canvas.drawShapesWithFill = false
        canvas.fillColor = Color.white
        
        // Draw the circle
        
        canvas.drawEllipse(at: Point(x: x, y: y), width: diameter, height: diameter)
        
        // Code to make first circle bounce
        if x >= canvas.width {
            dx = -1
            
        } else if x <= 0 {
            dx = Int.random(in: -5...20)
            
        }  else if y >= canvas.height {
            dy = -1
            
        }   else if y <= 0 {
            dy = +1
        }
        
        
    }
}
