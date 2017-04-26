//
//  ViewController.swift
//  Lab3
//
//  Created by Kevin Lee on 9/27/16.
//  Copyright © 2016 Kevin Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var drawView : DrawView!
    
    @IBOutlet weak var thickSlider: UISlider!
        override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clearTapped(){
        drawView.linesArray = []
    drawView.subviews.forEach({ $0.removeFromSuperview() })
        drawView.setNeedsDisplay()
    }   
    @IBAction func undoTapped(){
        if drawView.linesArray.count > 0 {
            drawView.tempLine = drawView.linesArray.removeLast()
        
        drawView.setNeedsDisplay()
        }
        
    }
    @IBAction func redoTapped(){
        if drawView.linesArray[drawView.linesArray.count-1] !== drawView.tempLine {
        drawView.linesArray.append(drawView.tempLine)
        drawView.setNeedsDisplay()
        }
    }
 
    @IBAction func thickChanged(_ sender: AnyObject) {
        let thickness = thickSlider.value
        let myCGFloat = CGFloat(thickness)
        drawView.lineWidth = myCGFloat
    }
    @IBAction func backChangeWhite(){
        drawView.backgroundColor = UIColor.white
    }
    @IBAction func backChangeBrown(){
        drawView.backgroundColor = UIColor.brown
    }
    @IBAction func backChangeBlack(){
        drawView.backgroundColor = UIColor.black
    }
    
    @IBAction func changeRed(){
      drawView.lineColor = UIColor.red
        
    }
    @IBAction func changeOrange(){
      drawView.lineColor = UIColor.orange
    }
    @IBAction func changePurple(){
      drawView.lineColor = UIColor.purple
    }
    @IBAction func changeGreen(){
       drawView.lineColor = UIColor.green
    }
    @IBAction func changeBlue(){
        drawView.lineColor = UIColor.blue
    }
    @IBAction func changeBlack(){
        drawView.lineColor = UIColor.black
    }
}

