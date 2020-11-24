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
    var drawCircle: Bool
    // Computed property
    var radius: Int {
        return self.diameter / 2
    }
    
    // 2. Initializer (initialize, or "set up" the properties with a first value)
    
    init(x: Int, y: Int, dx: Int, dy: Int, diameter: Int, drawCircle: Bool) {
        
        
        // "self" refers to the properties from THIS class
        // light blue refers to the property
        // white refers to the local prameter value
        
        
        self.x = x
        self.y = y
        self.dx = dx
        self.dy = dy
        self.diameter = diameter
        self.drawCircle = drawCircle
    }
    
    // 3. Methods (make things happen)
    
    func update(on canvas: Canvas){
        
        
        
        
        // Move the circle
        x += dx
        y += dy
        
        // Set circle colors
        canvas.drawShapesWithFill = false
        canvas.borderColor = Color.white
        canvas.defaultBorderWidth = 0
        
        // Draw the circle
        if drawCircle == true {
            canvas.drawEllipse(at: Point(x: x, y: y), width: diameter, height: diameter)
        }
        
        // Code to make first circle bounce
        if x >= canvas.width {
            dx = -1
            
        } else if x <= 0 {
            dx = +1
            
        }  else if y >= canvas.height {
            dy = -1
            
        }   else if y <= 0 {
            dy = +1
        }
        
        
    }
    
    
    func drawLineWhenOverlappingWith(other: MovingCircle, on canvas: Canvas) {
        // Distance between circles
        let a = Double(self.x - other.x)
        let b = Double(self.y - other.y)
        let d = sqrt(a*a + b*b)
        // print("Distance between circles is \(d)")
        
        // Map the distance between circles to alpha
        let alpha = map(value: d, fromLower: 40, fromUpper: Double(self.radius + other.radius), toLower: 10, toUpper: 50)
        
        
        //if the sum of the radii is larger than the distance between circles draw a line
        if d < Double(self.radius + other.radius) {
            let int = Int.random(in: 1...500)
            let int2 = Int.random(in: 1...500)
            let rainbow = Color(hue: int2, saturation: int, brightness: int, alpha: Int(alpha))
            
            canvas.lineColor = rainbow
            canvas.drawLine(from: Point(x: self.x, y: self.y), to: Point(x: other.x, y: other.y))
            
            canvas.textColor = Color(hue: int, saturation: int2, brightness: int2, alpha: Int(alpha))
            canvas.drawText(message: "boom", at: Point(x: self.x, y: self.y), size: 10, kerning: 0)
            
            
            
            //            canvas.fillColor = Color(hue: int, saturation: int2, brightness: int, alpha: Int(alpha))
            //            canvas.drawEllipse(at: Point(x: self.x, y: self.y), width: 30, height: 30)
        }
    }
}
