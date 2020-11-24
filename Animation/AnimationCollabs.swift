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
class AnimationCollabs: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    
    var spirals: [IndividualSpiral] = []    // Empty list
    var circless: [MovingCircle] = [] // Empty list (array)
    
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        for i in 1...18 {
            
            // Give the one spiral a starting angle of rotation
            let spiral = IndividualSpiral(angleOffset: i * 20,
                                          hue: Float(i) * 20)
            
            // Add the new spiral to the list
            spirals.append(spiral)
        }
        
        for _ in 1...15 {
            
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
            
            let newCircle = MovingCircle(x: Int.random(in: 0...canvas.width),y: Int.random(in: 0...canvas.height), dx: dx, dy: dy, diameter: 125, drawCircle: false)
            
            // Now add the new circle to the list
            circless.append(newCircle)
            
        }
        
        
        
        
        canvas.drawShapesWithBorders = true
        canvas.borderColor = Color.black
        canvas.frameCount = 40
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        canvas.drawShapesWithFill = true
        canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 0, alpha: 10)
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: 500, height: 500)
        canvas.defaultBorderWidth = 3
        
        
        
        //    canvas.fillColor = rainbow
        
        // Update each circles position on the canvas
        for i in 0...circless.count - 1 {
            circless[i].update(on: canvas)
        }
        
        
        
        
        
        for i in stride(from: 0, through: circless.count - 2, by: 1) {
            
            for j in stride(from: i + 1, through: circless.count - 1, by: 1) {
                
                circless[i].drawLineWhenOverlappingWith(other: circless[j], on: canvas)
            }
        }
        
        canvas.translate(to: Point(x: canvas.width / 2, y: canvas.height / 2))
        
        // Update the position of that one spiral
        for spiral in spirals {
            spiral.update(on: canvas)
           
        }
        
        if canvas.frameCount % 200 == 0 {
            for spiral in spirals {
                spiral.delayInSeconds += 2
            }
            
        }
        
        
        
        
        
        
    }
    
}

//mazal copyright infringed fine 90990290393920910 $$ dollas
