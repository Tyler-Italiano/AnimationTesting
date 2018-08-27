//
//  ViewController.swift
//  CircularLoader
//
//  Created by mobi.support on 12/11/17.
//  Copyright © 2017 mobi.support. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let shaperLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shaperLayer.path = circularPath.cgPath
        
        shaperLayer.strokeColor = UIColor.green.cgColor
        shaperLayer.lineWidth = 10
        shaperLayer.fillColor = UIColor.clear.cgColor
        shaperLayer.lineCap = kCALineCapRound
        
        shaperLayer.strokeEnd = 0
        
        view.layer.addSublayer(shaperLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap(){
        print("Attempting to animate stroke")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        
        
        shaperLayer.add(basicAnimation, forKey: "urSoBasic")
        
    }


}

