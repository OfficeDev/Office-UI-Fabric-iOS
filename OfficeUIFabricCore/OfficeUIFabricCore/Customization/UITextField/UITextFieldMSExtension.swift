// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

extension UITextField {
    
    // MARK: TextField Background
    
    public func msTextFieldBox(borderColor: UIColor = UIColor.msNeutralSecondaryAlt(), backgroundColor: UIColor = UIColor.clear, leftPadding: CGFloat = MSTextFieldConstants.DefaultPadding) {
        self.borderStyle = UITextField.BorderStyle.none
        self.background = UIImage.msTextFieldBoxBackground(borderColor: borderColor, fillColor: backgroundColor)
        self.setLeftPadding(padding: leftPadding)
    }
    
    public func msTextFieldUnderline(borderColor: UIColor = UIColor.msNeutralSecondaryAlt(), backgroundColor: UIColor = UIColor.clear, leftPadding: CGFloat = MSTextFieldConstants.DefaultPadding) {
        self.borderStyle = UITextField.BorderStyle.none
        self.background = UIImage.msTextFieldUnderlineBackground(borderColor: borderColor, fillColor: backgroundColor)
        self.setLeftPadding(padding: leftPadding)
    }
    
    private func setLeftPadding(padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 0))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
    
    // MARK: TextField Font Style
    
    public func msTextFieldFontStyles(style: MSFontStyle = MSFontStyle.L, textColor: UIColor = UIColor.msNeutralPrimary()) {
        self.msTextFieldFontStyles(style: style, fontWeight: MSFontConstants.msPreferredFontWeight(style: style), textColor: textColor)
    }
    
    public func msTextFieldFontStyles(style: MSFontStyle = MSFontStyle.L, fontWeight: MSFontWeight, textColor: UIColor = UIColor.msNeutralPrimary()) {
        self.msTextFieldFontStyles(font: UIFont.msFont(style: style, weight: fontWeight), textColor: textColor)
    }
    
    public func msTextFieldFontStyles(font: UIFont?, textColor: UIColor = UIColor.msNeutralPrimary()) {
        self.font = font
        self.textColor = textColor
    }
    
    // MARK: TextField Placeholder Text
    
    public func msTextFieldPlaceholderText(text: String, placeholderColor: UIColor = UIColor.msNeutralSecondary(), font: UIFont? = nil) {
        if let font = font {
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: convertToOptionalNSAttributedStringKeyDictionary([
                convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): placeholderColor,
                convertFromNSAttributedStringKey(NSAttributedString.Key.font): font
            ]));
        } else {
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: convertToOptionalNSAttributedStringKeyDictionary([
                convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): placeholderColor
            ]));
        }
    }
    
    // MARK: Permament Placeholder Text
    
    public func msTextFieldPermanentPlaceholderText(text: String, placeholderColor: UIColor = UIColor.msNeutralSecondary(), font: UIFont? = nil, padding: CGFloat = MSTextFieldConstants.DefaultPadding * 2) {
        let placeholderLabel = UILabel()
        if let font = font ?? self.font {
            placeholderLabel.font = font
        }
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.text = text
        placeholderLabel.sizeToFit()
        placeholderLabel.textAlignment = .center
        placeholderLabel.frame = CGRect(
            origin: placeholderLabel.frame.origin,
            size: CGSize(width: placeholderLabel.frame.width + padding, height: self.frame.size.height)
        )
        self.leftView = placeholderLabel
        self.leftViewMode = UITextField.ViewMode.always
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}
