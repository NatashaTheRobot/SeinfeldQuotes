//
//  TextInputTableViewCell.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/10/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class TextInputTableViewCell: UITableViewCell {

    @IBOutlet weak private var textField: UITextField!

    typealias textFieldChangedHandlerType = (String) -> Void
    private var textFieldChangedHander: textFieldChangedHandlerType?
    
    override func awakeFromNib() {
        textField.addTarget(self, action: "textFieldValueChanged:", forControlEvents: .EditingChanged)
    }
    
    func configure(#text: String?, placeholder: String, textFieldChangedHandler: textFieldChangedHandlerType?) {
        
        textField.placeholder = placeholder
        textField.text = text
        
        textField.accessibilityLabel = placeholder
        textField.accessibilityValue = text
        
        self.textFieldChangedHander = textFieldChangedHandler
    }
    
    func textFieldValueChanged(sender: UITextField) {
        if let textFieldChangedHandler = textFieldChangedHander {
            textFieldChangedHandler(sender.text)
        }
    }
}
