// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

open class InitialsView: UIView {
    private(set) open var initialsLabel: UILabel = UILabel()
    
    // MARK: Initialization
    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpInitialsLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpInitialsLabel()
    }
    
    private func setUpInitialsLabel() {
        self.initialsLabel.frame = self.bounds
        self.initialsLabel.textAlignment = .center
        self.initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.initialsLabel.font = UIFont.msFont(style: MSFontStyle.XL, weight: MSFontWeight.Regular)
        self.initialsLabel.textColor = UIColor.msNeutralWhite()
        self.initialsLabel.clipsToBounds = true
        self.addSubview(self.initialsLabel)
        self.setUpConstraints()
    }
    
    private func setUpConstraints() {
        let views = ["label": self.initialsLabel]
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[label]-0-|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: views)
        self.addConstraints(horizontalConstraints)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[label]-0-|", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: views)
        self.addConstraints(verticalConstraints)
    }
    
    // MARK: Usage
    
    open func setInitialsFromTitle(title: String) {
        self.initialsLabel.text = title.initials().uppercased()
        self.backgroundColor = UIColor.msHashColor(hash: title)
    }
}
