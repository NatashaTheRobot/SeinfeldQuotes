//
//  TwoLabelTableViewCell.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/9/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class TwoLabelTableViewCell: UITableViewCell {

    @IBOutlet weak private var headerLabel: UILabel!
    @IBOutlet weak private var subheadLabel: UILabel!
    
    func configure(#headerText: String, subheadText: String, textColor: UIColor = UIColor.blackColor()) {
        
        headerLabel.textColor = textColor
        subheadLabel.textColor = textColor
        
        headerLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        subheadLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        
        headerLabel.text = headerText
        headerLabel.accessibilityLabel = headerText
        
        subheadLabel.text = "- \(subheadText)"
        subheadLabel.accessibilityLabel = subheadText
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.preferredMaxLayoutWidth = frame.width
    }
}
