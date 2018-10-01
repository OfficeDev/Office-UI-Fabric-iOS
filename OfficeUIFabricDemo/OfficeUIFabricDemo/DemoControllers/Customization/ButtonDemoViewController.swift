// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

class ButtonDemoViewController: UIViewController {
    @IBOutlet weak var standardButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var disabledButton: UIButton!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var toggleIconButton: UIButton!
    @IBOutlet weak var disabledPrimaryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.standardButton.msStandardButton()
        self.primaryButton.msPrimaryButton()
        
        self.toggleButton.msStandardButton()
        self.toggleIconButton.msStandardButton()
        
        self.disabledButton.msStandardButton()
        self.disabledPrimaryButton.msPrimaryButton()
    }
    
    @IBAction func toggleButtonTap(_ sender: AnyObject) {
        if let button = sender as? UIButton {
            button.isSelected = !button.isSelected
            button.tintColor = button.titleColor(for: button.isSelected ? UIControl.State.selected : UIControl.State())
        }
    }
}
