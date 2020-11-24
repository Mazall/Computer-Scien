//
//  IndividualSpiral.swift
//  Animation
//
//  Created by Russell Gordon on 2020-11-09.
//  Copyright © 2020 Royal St. George's College. All rights reserved.
//
import Foundation
import CanvasGraphics

// Define a class that creates a spiral
// - a "class" is just a way to group data (properties) together
//   with behaviour (things that we want to happen)
class IndividualSpiral {
    
    // 1. Properties
    //
    //    A property is something that describes the item.
    //    e.g.: A student at LCS has a house, a hair color, a height
    var lastPoint: Point
    var angleOffset: Int
    var hue: Float
    var delayInSeconds: Int // How much of a delay to have before the animation begins
    
    // 2. Initializer
    //
    //    An initializer has one job: give each property an initial
    //    value
    init(angleOffset: Int, hue: Float) {
        
        // I want every spiral to begin at the same position
        self.lastPoint = Point(x: 0, y: 0)
        
        // Each spiral begins at a slightly different angle
        self.angleOffset = angleOffset
        
        // Set the hue
        self.hue = hue
        
        // Delay in seconds
        self.delayInSeconds = 5
        
    }
    
    // 3. Methods
    //
    //    Here we describe what behaviour we want to have happen.
    
    // Update (or draw) the position of this spiral
    func update(on canvas: Canvas) {
        
        // Only draw on the canvas after the delay in seconds has been reached
        if canvas.frameCount > delayInSeconds * canvas.framesPerSecond {
            
            // Set the radius
            let radius = CGFloat(canvas.frameCount - delayInSeconds * canvas.framesPerSecond) / 0.5
            
            // Set the angle equal to the frameCount
            let angle = CGFloat(canvas.frameCount + angleOffset)
            
            // Determine the next x position
            let nextX = cos(angle.asRadians()) * radius
            
            // Determine the next y position
            let nextY = sin(angle.asRadians()) * radius
            
            // Set the next point
            let nextPoint = Point(x: nextX, y: nextY)
            //            print(nextPoint)
            
            // Set the line color
            canvas.lineColor = Color(hue: hue,
                                     saturation: 80,
                                     brightness: 90,
                                     alpha: 100)
            canvas.defaultLineWidth = 10
            // Draw a line from the last point to the next point
            canvas.drawLine(from: lastPoint, to: nextPoint)
            
            // Set the "new" last point, now that the line is drawn
            lastPoint = nextPoint
            
            
            
        }
        
    }
}
