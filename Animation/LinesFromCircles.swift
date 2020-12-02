//
//  EmptySketch.swift
//  Animation
//
//  Created by Russell Gordon on 2020-06-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class LineFromCircles: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    
    var circles: [MovingCircle] = [] // Empty list (array)
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        
        for _ in 1...20 {
            
            // Randomly pick horizontal direction
            var dx = 1
            if Bool.random() == true {
                dx *= -1
            }
            var dy = 1
            if Bool.random() == true {
                dy *= -1
            }
            
            // Create new circle
            
            let newCircle = MovingCircle(x: Int.random(in: 0...canvas.width),y: Int.random(in: 0...canvas.height), dx: dx, dy: dy, diameter: 125, drawCircle: true)
            
            // Now add the new circle to the list
            circles.append(newCircle)
            
        }
        
        
        
        
        canvas.drawShapesWithBorders = true
        canvas.borderColor = Color.black
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        canvas.drawShapesWithFill = true
        canvas.fillColor = Color(hue: 1000, saturation: 0, brightness: 0, alpha: 5)
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: 500, height: 500)
        canvas.defaultBorderWidth = 3
        
        
        
        //    canvas.fillColor = rainbow
        
        // Update each circles position on the canvas
        for i in 0...circles.count - 1 {
            circles[i].update(on: canvas)
        }
        
        
        
        
        
        
        for i in stride(from: 0, through: circles.count - 2, by: 1) {
            
            for j in stride(from: i + 1, through: circles.count - 1, by: 1) {
                
                circles[i].drawLineWhenOverlappingWith(other: circles[j], on: canvas)
            }
        }
        
        
    }
    
}
//mazal copyright infringed fine 90990290393920910 $$ dollas
