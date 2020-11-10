//  EmptySketch.swift
//  Animation
//
//  Created by Russell Gordon on 2020-06-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class Spiral: NSObject, Sketchable {
    

    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
// Add 1 spiral
    var spiral: IndividualSpiral
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
                

  // Give the 1 spiral a starting angle of rotation
        spiral = IndividualSpiral(angleOffset: 90)
        
        // Speed
        canvas.framesPerSecond = 80
    }
    

    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        

        // What frame are we on?
//        print(canvas.frameCount)
        
        canvas.defaultLineWidth = 1
        
        // Set the origin to be the middle of the canvas
        canvas.translate(to: Point(x: canvas.width / 2, y: canvas.height / 2))
        

// update the position of that one spiral
        spiral.update(on: canvas)
   
        

    }
    

}
