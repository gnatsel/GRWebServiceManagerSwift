//
//  UIColor+ColorUtils.swift
//  SampleGRWebServiceManager
//
//  Created by Olivier Lestang [DAN-PARIS] on 18/08/2015.
//  Copyright (c) 2015 Gnatsel Reivilo. All rights reserved.
//

import UIKit

extension UIColor{
    
    static func colorWithHex(hexValue:String) -> UIColor{
        var cString:String = hexValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (count(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
