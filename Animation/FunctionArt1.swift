//  EmptySketch.swift
//  Animation
//
//  Created by Russell Gordon on 2020-06-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//
import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class FunctionArt1: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // Add many spirals
    // This is now a list, or an array, of functions
    var functions: [MathFunction] = []    // empty list
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Initialize many functions
        for i in 1...11 {
            
            // Create the function
            let newFunction = MathFunction(a: 5.0,
                                           k: 2.0,
                                           d: CGFloat(i) * 5,
                                           c: 0,
                                           canvas: canvas,
                                           type: .yoAlien)
            
            // Add it to the list
            functions.append(newFunction)
            // Add the new spiral to the list
        }
        
        // Speed
        canvas.framesPerSecond = 60
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Clear the canvas
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 100, alpha: 20)
        canvas.fillColor = Color(hue: 0, saturation: 100, brightness: 0, alpha: 10)
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: 1000, height: 1000)
        
        
        canvas.defaultLineWidth = 1
        
        // Set the origin to be the middle of the canvas
        canvas.translate(to: Point(x: canvas.width / 2, y: canvas.height / 2))
        
        
        // Randomly change the vertical position
        //        let newC = Int.random(in: -150...150)
        
        
        // Draw the entire list of funnctions all at once
        for x in 0...canvas.width {
            
            
            // Update the position of all functions
            for function in functions {
                
                //                function.c = CGFloat(newC)
                
                // Gradually change the vertical stretch / compression
                function.a = 0.25 * sin(Degrees(canvas.frameCount).asRadians() / 0.25)
                
                function.update(on: canvas,
                                usingInputValue: x)
            }
            
        }
        
        
        
    }
    
}
