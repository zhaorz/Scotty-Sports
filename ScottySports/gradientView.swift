//
//  gradientView.swift
//  ScottySports
//
//  Copyright (c) 2015 KIRK. All rights reserved.
//

import UIKit

class gradientView: UIView {

    override func drawRect(rect: CGRect) {
        // Get current context
        var currentContext = UIGraphicsGetCurrentContext()
        
        // Save the state
        CGContextSaveGState(currentContext);
        
        var colorSpace = CGColorSpaceCreateDeviceRGB()
        
        var startColor = UIColor(red: 216/255.0, green: 217/255.0, blue: 218/250.0, alpha: 255/255.0);
        var startColorComponents = CGColorGetComponents(startColor.CGColor)
        var endColor = UIColor(red: 145/255.0, green: 146/255.0, blue: 149/255.0, alpha: 255/255.0);
        var endColorComponents = CGColorGetComponents(endColor.CGColor)
        
        var colorComponents
        = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        var locations:[CGFloat] = [0.0, 1.0]
        
        var gradient = CGGradientCreateWithColorComponents(colorSpace,&colorComponents,&locations,2)
        
        // Goes top to bottom
        var startPoint = CGPointMake(0, 0)
        var endPoint = CGPointMake(0, self.bounds.height)
        
        // 8
        CGContextDrawLinearGradient(currentContext,gradient,startPoint,endPoint, 0)
        
        // 9
        CGContextRestoreGState(currentContext);
    }

}
