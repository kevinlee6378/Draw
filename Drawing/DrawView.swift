//
//  DrawView.swift
//  Lab3
//
//  Created by Kevin Lee on 9/28/16.
//  Copyright © 2016 Kevin Lee. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var pointsArray = [CGPoint]()
    var currentPoint = CGPoint.zero
    var previousPoint = CGPoint.zero
    var linesArray = [Line]()
    var tempLine = Line(path: UIBezierPath(),thickness: 10.0, color: UIColor.black)
    var lineWidth: CGFloat = 10.0
    var lineColor: UIColor = UIColor.black
    var currentLine = Line(path: UIBezierPath(),thickness: 10.0, color: UIColor.black)
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch!
        currentPoint = (touch?.location(in: self))!
        previousPoint = currentPoint
        pointsArray.append(currentPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch!
       
        currentPoint = (touch?.location(in: self))!
        if (previousPoint != currentPoint){
        pointsArray.append(currentPoint)
        }
        previousPoint = currentPoint
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pointsArray.count == 1 {
        let dot = UIView(frame: CGRect(x: pointsArray[0].x, y: pointsArray[0].y, width: 2*lineWidth/2.2, height: 2*lineWidth/2.2))
        dot.layer.cornerRadius = lineWidth/2.2
        dot.backgroundColor = lineColor
        self.addSubview(dot)
        }
        currentLine = Line(path: createQuadPath(pointsArray),thickness: lineWidth, color: lineColor)
        linesArray.append(currentLine)
        pointsArray = []
    }
    
    fileprivate func findMidpoint(_ firstPoint: CGPoint, secondPoint: CGPoint) -> CGPoint {
        let midX = (firstPoint.x + secondPoint.x)/2
        let midY = (firstPoint.y + secondPoint.y)/2
        let midPoint = CGPoint(x: midX, y: midY)
        return midPoint
    }
    
    func createQuadPath(_ arrayOfPoints: [CGPoint]) -> UIBezierPath {
        let newPath = UIBezierPath()
//        newPath.addArcWithCenter(arrayOfPoints[0], radius: 0, startAngle: 0, endAngle: CGFloat(M_2_PI), clockwise: true)
        if arrayOfPoints.count > 1 {
        let firstLocation = arrayOfPoints[0]
            newPath.move(to: firstLocation)
            let secondLocation = arrayOfPoints[1]
            let firstMidpoint = findMidpoint(firstLocation, secondPoint: secondLocation)
            newPath.addLine(to: firstMidpoint)
            for index in 1 ..< arrayOfPoints.count-1 {
                let currentLocation = arrayOfPoints[index]
                let nextLocation = arrayOfPoints[index + 1]
                let midpoint = findMidpoint(currentLocation, secondPoint: nextLocation)
                newPath.addQuadCurve(to: midpoint, controlPoint: currentLocation)
            }
        
        let lastLocation = arrayOfPoints.last
        newPath.addLine(to: lastLocation!)
        }
        return newPath
    }
    
    override func draw(_ rect: CGRect) {
        currentLine = Line(path: createQuadPath(pointsArray),thickness: lineWidth, color: lineColor)
        currentLine.strokeLine()
        for line in linesArray{
            line.strokeLine()
        }
    }
}
