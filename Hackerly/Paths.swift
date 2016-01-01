//
//  Paths.swift
//  Hackerly
//
//  Created by Gowda I V, Praveen on 12/31/15.
//  Copyright © 2015 Gowda I V, Praveen. All rights reserved.
//

import UIKit

struct Paths {
    
    static var star: CGPath {
        let polygonPath = UIBezierPath()
        polygonPath.moveToPoint(CGPointMake(66, 7))
        polygonPath.addLineToPoint(CGPointMake(83.32, 35.5))
        polygonPath.addLineToPoint(CGPointMake(48.68, 35.5))
        polygonPath.closePath()
        polygonPath.fill()
        return polygonPath.CGPath
    }

    static func circle(frame: CGRect) -> CGPath {
        let rectanglePath = UIBezierPath(roundedRect: CGRectMake(frame.minX, frame.minY, 40, 35), cornerRadius: 4)
        UIColor.lightGrayColor().setStroke()
        rectanglePath.stroke()
        return rectanglePath.CGPath
    }

}
