//
//  QuoteViewModel.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/10/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

class QuoteViewModel {
    
    var quoteContent: String?
    var quoteScene: String?
    
    let quoteContentPlaceholder = "Quote Content"
    let quoteScenePlaceholder = "Scene Description"
    
    init(quoteContent: String? = nil, quoteScene: String? = nil) {
        self.quoteContent = quoteContent
        self.quoteContent = quoteScene
    }
}
