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
    var random = Int.random(in: 1...360)
    var random2 = Int.random(in: 1...360)
    
    var x: Int
    var y: Int
    
    var dx: Int
    var dy: Int
    
    var words = ["Ⓐ, ⓐ, ⒜, A, a, Ạ, ạ, Å, å, Ä, ä, Ả, ả, Ḁ, ḁ, Ấ, ấ, Ầ, ầ, Ẩ, ẩ, Ȃ, ȃ, Ẫ ẫ Ậ ậ Ắ ắ Ằ ằ Ẳ ẳ Ẵ ẵ Ặ ặ Ā ā Ą ą Ȁ ȁ Ǻ ǻ Ȧ ȧ Á á Ǟ ǟ Ǎ ǎ À à Ã ã Ǡ ǡ Â â Ⱥ ⱥ Æ æ Ǣ ǣ Ǽ ǽ Ɐ Ꜳ ꜳ Ꜹ ꜹ Ꜻ ꜻ Ɑ ℀ ⅍ ℁ ª Ⓑ ⓑ ⒝ B b Ḃ ḃ Ḅ ḅ Ḇ ḇ Ɓ Ƀ ƀ Ƃ ƃ Ƅ ƅ ℬ Ⓒ ⓒ ⒞ C c Ḉ ḉ Ć ć Ĉ ĉ Ċ ċ Č č Ç ç Ƈ ƈ Ȼ ȼ ℂ ℃ Ɔ Ꜿ ꜿ ℭ ℅ ℆ ℄ Ⓓ ⓓ ⒟ D d Ḋ ḋ Ḍ ḍ Ḏ ḏ Ḑ ḑ Ḓ ḓ Ď ď Ɗ Ƌ ƌ Ɖ Đ đ ȡ Ǳ ǲ ǳ Ǆ ǅ ǆ ȸ ⅅ ⅆ Ⓔ ⓔ ⒠ E e Ḕ ḕ Ḗ ḗ Ḙ ḙ Ḛ ḛ Ḝ ḝ Ẹ ẹ Ẻ ẻ Ế ế Ẽ ẽ Ề ề Ể ể Ễ ễ Ệ ệ Ē ē Ĕ ĕ Ė ė Ę ę Ě ě È è É é Ê ê Ë ë Ȅ ȅ Ȩ ȩ Ȇ ȇ Ǝ ⱻ Ɇ ɇ Ə ǝ ℰ ⱸ ℯ ℮ ℇ Ɛ Ⓕ ⓕ ⒡ F f Ḟ ḟ Ƒ ƒ ꜰ Ⅎ ⅎ ꟻ ℱ ℻ Ⓖ ⓖ ⒢ G g Ɠ Ḡ ḡ Ĝ ĝ Ğ ğ Ġ ġ Ǥ ǥ Ǧ ǧ Ǵ ℊ ⅁ ǵ Ģ ģ Ⓗ ⓗ ⒣ H h Ḣ ḣ Ḥ ḥ Ḧ ḧ Ḩ ḩ Ḫ ḫ Ĥ ĥ Ȟ ȟ Ħ ħ Ⱨ ⱨ Ꜧ ℍ Ƕ ẖ ℏ ℎ ℋ ℌ ꜧ Ⓘ ⓘ ⒤ I i Ḭ ḭ Ḯ ḯ Ĳ ĳ Í í Ì ì Î î Ï ï Ĩ ĩ Ī ī Ĭ ĭ Į į Ǐ ǐ ı ƚ Ỻ ⅈ ⅉ ℹ ℑ ℐ Ⓙ ⓙ ⒥ J j Ĵ ĵ Ɉ ɉ ȷ ⱼ ǰ Ⓚ ⓚ ⒦ K k Ḱ ḱ Ḳ ḳ Ḵ ḵ Ķ ķ Ƙ ƙ Ꝁ ꝁ Ꝃ ꝃ Ꝅ ꝅ Ǩ ǩ Ⱪ ⱪ ĸ Ⓛ ⓛ ⒧ L l Ḷ ḷ Ḹ ḹ Ḻ ḻ Ḽ ḽ Ĺ ĺ Ļ ļ Ľ ľ Ŀ ŀ Ł ł Ỉ ỉ Ⱡ ⱡ Ƚ ꝉ Ꝉ Ɫ Ǉ ǈ ǉ Ị İ ị ꞁ ⅃ ⅂ Ȉ ȉ Ȋ ȋ ℓ ℒ Ⓜ ⓜ ⒨ M m Ḿ ḿ Ṁ ṁ Ṃ ṃ ꟿ ꟽ Ɱ Ɯ ℳ Ⓝ ⓝ ⒩ N n Ṅ ṅ Ṇ ṇ Ṉ ṉ Ṋ ṋ Ń ń Ņ ņ Ň ň Ǹ ǹ Ñ ñ Ƞ ƞ Ŋ ŋ Ɲ ŉ Ǌ ǋ ǌ ȵ ℕ № Ⓞ ⓞ ⒪ O o Ö ö Ṏ ṏ Ṍ ṍ Ṑ ṑ Ṓ ṓ Ȫ ȫ Ȭ ȭ Ȯ ȯ Ȱ ȱ Ǫ ǫ Ǭ ǭ Ọ ọ Ỏ ỏ Ố ố Ồ ồ Ổ ổ Ỗ ỗ Ộ ộ Ớ ớ Ờ ờ Ở ở Ỡ ỡ Ợ ợ Ơ ơ Ō ō Ŏ ŏ Ő ő Ò ò Ó ó Ô ô Õ õ Ǒ ǒ Ȍ ȍ Ȏ ȏ Œ œ Ø ø Ǿ ǿ Ꝋ Ꝏ ꝏ ⍥ ⍤ ℴ Ⓟ ⓟ ⒫ ℗ P p Ṕ ṕ Ṗ ṗ Ƥ ƥ Ᵽ ℙ Ƿ ꟼ ℘ Ⓠ ⓠ ⒬ Q q Ɋ ɋ ℚ ℺ ȹ Ⓡ ⓡ ⒭ R r Ŕ ŕ Ŗ ŗ Ř ř Ṙ ṙ Ṛ ṛ Ṝ ṝ Ṟ ṟ Ȑ ȑ Ȓ ȓ Ɍ ɍ Ʀ Ꝛ ꝛ Ɽ ℞ ℜ ℛ ℟ ℝ Ⓢ ⓢ ⒮ S s Ṡ ṡ Ṣ ṣ Ṥ ṥ Ṧ ṧ Ṩ ṩ Ś ś Ŝ ŝ Ş ş Š š Ș ș ȿ ꜱ Ƨ ƨ Ϩ ϩ ẞ ß ẛ ẜ ẝ ℠ Ⓣ ⓣ ⒯ T t Ṫ ṫ Ṭ ṭ Ṯ ṯ Ṱ ṱ Ţ ţ Ť ť Ŧ ŧ Ț ț Ⱦ ⱦ Ƭ Ʈ ƫ ƭ ẗ ȶ ℡ ™ Ⓤ ⓤ ⒰ U u Ṳ ṳ Ṵ ṵ Ṷ ṷ Ṹ ṹ Ṻ ṻ Ủ ủ Ụ ụ Ứ ứ Ừ ừ Ử ử Ữ ữ Ự ự Ũ ũ Ū ū Ŭ ŭ Ů ů Ű ű Ǚ ǚ Ǘ ǘ Ǜ ǜ Ų ų Ǔ ǔ Ȕ ȕ Û û Ȗ ȗ Ù ù Ú ú Ü ü Ư ư Ʉ Ʋ Ʊ Ⓥ ⓥ ⒱ V v Ṽ ṽ Ṿ ṿ Ʌ ℣ Ỽ ⱱ ⱴ ⱽ Ⓦ ⓦ ⒲ W w Ẁ ẁ Ẃ ẃ Ẅ ẅ Ẇ ẇ Ẉ ẉ Ŵ ŵ Ⱳ ⱳ Ϣ ϣ ẘ Ⓧ ⓧ ⒳ X x Ẋ ẋ Ẍ ẍ ℵ × Ⓨ ⓨ ⒴ y Y Ẏ ẏ Ỿ ỿ Ỳ ỳ Ỵ ỵ Ỷ ỷ Ỹ ỹ Ŷ ŷ Ƴ ƴ Ÿ ÿ Ý ý Ɏ ɏ Ȳ ȳ Ɣ ẙ ⅄ ℽ Ⓩ ⓩ ⒵ Z z Ẑ ẑ Ẓ ẓ Ẕ ẕ Ź ź Ż ż Ž ž Ȥ ȥ Ⱬ ⱬ Ƶ ƶ ɀ ℨ ℤ"]
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
        
        let int = Int.random(in: 1...500)
        let int2 = Int.random(in: 1...500)
        let rainbow = Color(hue: int2, saturation: int, brightness: int, alpha: Int(int2))
        
        
        // Move the circle
        x += dx
        y += dy
        
        // Set circle colors
        canvas.drawShapesWithFill = false
        canvas.borderColor = Color.white
        canvas.defaultBorderWidth = 0
        
        // Draw the circle
        if drawCircle == true {
           // canvas.drawEllipse(at: Point(x: x, y: y), width: diameter, height: diameter)
            canvas.defaultBorderWidth = 15
            canvas.defaultLineWidth = 10
            canvas.borderColor = rainbow
            
            var star: [Point] = []
            star.append(Point(x: x + 0, y: y - 50))
            star.append(Point(x: x + 14, y: y - 20))
            star.append(Point(x: x + 47, y: y - 15))
            star.append(Point(x: x + 23, y: y + 7))
            star.append(Point(x: x + 29, y: y + 40))
            star.append(Point(x: x + 0, y: y + 25))
            star.append(Point(x: x - 29, y: y + 40))
            star.append(Point(x: x - 23, y: y + 7))
            star.append(Point(x: x - 47, y: y - 15))
            star.append(Point(x: x - 14, y: y - 20))
            
            canvas.drawCustomShape(with: star)
        }
        
        // Code to make first circle bounce
        if x >= canvas.width {
            dx = -5
            
        } else if x <= 0 {
            dx = +5
            
        }  else if y >= canvas.height {
            dy = -5
            
        }   else if y <= 0 {
            dy = +5
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
            
            canvas.lineColor = Color(hue: random, saturation: random2, brightness: 70, alpha: 30)
            canvas.drawLine(from: Point(x: self.x, y: self.y), to: Point(x: other.x, y: other.y))
            
            canvas.textColor = rainbow
            canvas.drawText(message: "", at: Point(x: self.x, y: self.y), size: 6, kerning: 0)
            
            
            
            //            canvas.fillColor = Color(hue: int, saturation: int2, brightness: int, alpha: Int(alpha))
            //            canvas.drawEllipse(at: Point(x: self.x, y: self.y), width: 30, height: 30)
        }
    }
}
