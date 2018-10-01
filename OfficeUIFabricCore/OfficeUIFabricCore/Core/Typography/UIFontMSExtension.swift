// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

extension UIFont {
    public class func msFont(style: MSFontStyle) -> UIFont? {
        return msFont(style: style, weight: MSFontConstants.msPreferredFontWeight(style: style))
    }
    
    public class func msFont(style: MSFontStyle, weight: MSFontWeight) -> UIFont? {
        if #available(iOS 8.2, *) {
            return self.systemFont(ofSize: MSFontConstants.msFontSize(style: style), weight: UIFont.Weight(rawValue: MSFontConstants.fontWeight(msFontWeight: weight)))
        }
        return self.systemFont(ofSize: MSFontConstants.msFontSize(style: style))
    }
}
