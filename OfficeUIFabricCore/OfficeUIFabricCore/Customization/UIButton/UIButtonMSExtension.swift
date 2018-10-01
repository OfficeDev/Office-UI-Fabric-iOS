// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

extension UIButton {
    public func msStandardButton(mainColor: UIColor = UIColor.msThemePrimary(), disabledColor: UIColor = UIColor.msNeutralTertiaryAlt()) {
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: mainColor, fillColor: UIColor.clear), for: UIControl.State())
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: mainColor, fillColor: mainColor), for: .highlighted)
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: mainColor, fillColor: mainColor), for: .selected)
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: disabledColor, fillColor: disabledColor.withAlphaComponent(0.1)), for: .disabled)
        
        self.setTitleColor(mainColor, for: UIControl.State())
        self.setTitleColor(UIColor.msNeutralWhite(), for: .highlighted)
        self.setTitleColor(UIColor.msNeutralWhite(), for: .selected)
        self.setTitleColor(disabledColor, for: .disabled)
    }
    
    public func msPrimaryButton(mainColor: UIColor = UIColor.msThemePrimary(), selectedColor: UIColor = UIColor.msThemeDark(), disabledColor: UIColor = UIColor.msNeutralTertiaryAlt()) {
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: mainColor, fillColor: mainColor), for: UIControl.State())
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: selectedColor, fillColor: selectedColor), for: .highlighted)
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: selectedColor, fillColor: selectedColor), for: .selected)
        self.setBackgroundImage(UIImage.msButtonBackground(borderColor: disabledColor, fillColor: disabledColor), for: .disabled)
        
        self.setTitleColor(UIColor.msNeutralWhite(), for: UIControl.State())
        self.setTitleColor(UIColor.msNeutralWhite(), for: .highlighted)
        self.setTitleColor(UIColor.msNeutralWhite(), for: .selected)
        self.setTitleColor(UIColor.msNeutralWhite(), for: .disabled)
    }
}
