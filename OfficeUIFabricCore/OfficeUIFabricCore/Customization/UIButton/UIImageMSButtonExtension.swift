// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

extension UIImage {
    class func msButtonBackground(borderColor: UIColor, fillColor: UIColor, scale: CGFloat = UIScreen.main.scale) -> UIImage {
        
        let strokeWidth: CGFloat = 1
        let cornerRadius: CGFloat = 4
        let size = 11 * scale
        let bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: size, height: size))
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        
        borderColor.setStroke()
        fillColor.setFill()
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        // Clip corners from dirty pixels
        let roundCornerClip = UIBezierPath.reversing(roundedRect)()
        roundCornerClip.addClip()
        
        roundedRect.lineWidth = strokeWidth
        roundedRect.fill()
        roundedRect.stroke()
        
        let bgImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return UIImage(cgImage: bgImage!.cgImage!, scale: scale, orientation: UIImage.Orientation.up)
            .resizableImage(
                withCapInsets: UIEdgeInsets.init(
                    top: cornerRadius + strokeWidth,
                    left: cornerRadius + strokeWidth,
                    bottom: cornerRadius + strokeWidth,
                    right: cornerRadius + strokeWidth
                ), resizingMode: UIImage.ResizingMode.stretch)
    }
}
