//
//  Line.swift
//  Lab3
//
//  Created by Kevin Lee on 9/28/16.
//  Copyright © 2016 Kevin Lee. All rights reserved.
//

import UIKit

class Line {
    var path: UIBezierPath
    var thickness: CGFloat
    var color: UIColor
    
    init(path _path: UIBezierPath, thickness _thickness: CGFloat, color _color: UIColor){
        self.path = _path
        self.thickness = _thickness
        self.color = _color
    }
    
    func strokeLine(){
        let strokeColor = self.color
        strokeColor.setStroke()
        self.path.lineWidth = self.thickness
        self.path.stroke()
    }
    
}

