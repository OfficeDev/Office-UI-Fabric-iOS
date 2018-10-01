// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

open class LogoView: UIView {
    private(set) open var initialsView: InitialsView = InitialsView()
    private(set) open var imageView: UIImageView = UIImageView()
    
    // MARK: Initialization
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupSubviews()
    }
    
    private func setupSubviews() {
        self.imageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.imageView.clipsToBounds = true
        self.initialsView.clipsToBounds = true
        self.setupSubview(subview: self.imageView)
        self.setupSubview(subview: self.initialsView)
    }
    
    private func setupSubview(subview: UIView) {
        self.addSubview(subview)
        subview.isHidden = true
    }
    
    open override func layoutSubviews() {
        self.imageView.frame = self.bounds
        self.initialsView.frame = self.bounds
    }
    
    // MARK: Usage
    
    open func updateWithTitle(title: String) {
        self.initialsView.setInitialsFromTitle(title: title)
        self.initialsView.isHidden = false
        self.imageView.isHidden = true
    }
    
    open func updateWithImage(image: UIImage?) {
        self.imageView.image = image
        self.imageView.isHidden = false
        self.initialsView.isHidden = true
    }
}
