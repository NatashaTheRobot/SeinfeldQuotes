//
//  AddQuoteTests.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 10/5/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

class AddQuoteTests: KIFTestCase {
    
    func testAddQuote() {
        tester().tapAddButton()
        tester().fillInQuoteData()
        tester().saveQuote()
        tester().assertNewQuoteCreated()
    }
    
}

// MARK: Setup Accessibility Labels

private extension KIFUITestActor {
    enum ButtonLabel: String {
        case Add = "Add"
        case Save = "Save"
    }
    
    enum NavBarTitle: String {
        case CreateQuote = "Create Quote"
        case ListQuotes = "Seinfeld Quotes"
    }
    
    enum TextFieldLabel: String {
        case QuoteContent = "Quote Content"
        case SceneDescription = "Scene Description"
    }
    
    enum TextInput: String {
        case QuoteContent = "My Awesome Quote"
        case SceneDescription = "My Scene"
    }
    
}

// MARK: Test Details

private extension KIFUITestActor {
    
    func tapAddButton() {
        tester().tapViewWithAccessibilityLabel(ButtonLabel.Add.rawValue, traits: UIAccessibilityTraitButton)
        tester().waitForViewWithAccessibilityLabel(NavBarTitle.CreateQuote.rawValue, traits: UIAccessibilityTraitStaticText)
    }
    
    func fillInQuoteData() {
        tester().enterText(TextInput.QuoteContent.rawValue, intoViewWithAccessibilityLabel: TextFieldLabel.QuoteContent.rawValue)
        tester().enterText(TextInput.SceneDescription.rawValue, intoViewWithAccessibilityLabel: TextFieldLabel.SceneDescription.rawValue)
    }
    
    func saveQuote() {
        tester().tapViewWithAccessibilityLabel(ButtonLabel.Save.rawValue, traits: UIAccessibilityTraitButton)
        tester().waitForViewWithAccessibilityLabel(NavBarTitle.ListQuotes.rawValue, traits: UIAccessibilityTraitStaticText)
    }
    
    func assertNewQuoteCreated() {
        tester().waitForViewWithAccessibilityLabel(TextInput.QuoteContent.rawValue, traits: UIAccessibilityTraitStaticText)
        tester().waitForViewWithAccessibilityLabel(TextInput.SceneDescription.rawValue, traits: UIAccessibilityTraitStaticText)
    }
}



