// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

extension UIImage {
    class func msTextFieldBoxBackground(borderColor: UIColor, fillColor: UIColor, scale: CGFloat = UIScreen.main.scale) -> UIImage {
        
        let innerImageInsets: CGFloat = 1
        let strokeWidth: CGFloat = 1
        let size = 5 * scale
        let bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: size, height: size))
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        
        borderColor.setStroke()
        fillColor.setFill()
        
        let boxRect = UIBezierPath(rect: bounds)
        
        boxRect.lineWidth = strokeWidth
        boxRect.fill()
        boxRect.stroke()
        
        let bgImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return UIImage(cgImage: bgImage!.cgImage!, scale: scale, orientation: UIImage.Orientation.up)
            .resizableImage(
                withCapInsets: UIEdgeInsets.init(
                    top: innerImageInsets + strokeWidth,
                    left: innerImageInsets + strokeWidth,
                    bottom: innerImageInsets + strokeWidth,
                    right: innerImageInsets + strokeWidth
                ), resizingMode: UIImage.ResizingMode.stretch)
    }
    
    class func msTextFieldUnderlineBackground(borderColor: UIColor, fillColor: UIColor, scale: CGFloat = UIScreen.main.scale) -> UIImage {
        
        let innerImageInsets: CGFloat = 1
        let strokeWidth: CGFloat = 1
        let size = 5 * scale
        let bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: size, height: size))
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        
        borderColor.setStroke()
        fillColor.setFill()
        
        UIBezierPath(rect: bounds).fill()
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: 0, y: bounds.height - strokeWidth))
        context?.addLine(to: CGPoint(x: bounds.width, y: bounds.height - strokeWidth))
        
        context?.strokePath()
        
        let bgImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return UIImage(cgImage: bgImage!.cgImage!, scale: scale, orientation: UIImage.Orientation.up)
            .resizableImage(
                withCapInsets: UIEdgeInsets.init(
                    top: innerImageInsets + strokeWidth,
                    left: innerImageInsets + strokeWidth,
                    bottom: innerImageInsets + strokeWidth,
                    right: innerImageInsets + strokeWidth
                ), resizingMode: UIImage.ResizingMode.stretch)
    }
}
