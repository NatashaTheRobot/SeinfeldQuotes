//
//  AddQuoteTests.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 10/5/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

class AddQuoteTests: KIFTestCase {
    
    func testAddQuote() {
        tapAddButton()
        fillInQuoteData()
        saveQuote()
        assertNewQuoteCreated()
    }
    
}

// MARK: Setup Accessibility Labels

private extension AddQuoteTests {
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

private extension AddQuoteTests {
    
    func tapAddButton() {
        tester.tapViewWithAccessibilityLabel(ButtonLabel.Add.toRaw(), traits: UIAccessibilityTraitButton)
        tester.waitForViewWithAccessibilityLabel(NavBarTitle.CreateQuote.toRaw(), traits: UIAccessibilityTraitStaticText)
    }
    
    func fillInQuoteData() {
        tester.enterText(TextInput.QuoteContent.toRaw(), intoViewWithAccessibilityLabel: TextFieldLabel.QuoteContent.toRaw())
        tester.enterText(TextInput.SceneDescription.toRaw(), intoViewWithAccessibilityLabel: TextFieldLabel.SceneDescription.toRaw())
    }
    
    func saveQuote() {
        tester.tapViewWithAccessibilityLabel(ButtonLabel.Save.toRaw(), traits: UIAccessibilityTraitButton)
        tester.waitForViewWithAccessibilityLabel(NavBarTitle.ListQuotes.toRaw(), traits: UIAccessibilityTraitStaticText)
    }
    
    func assertNewQuoteCreated() {
        tester.waitForViewWithAccessibilityLabel(TextInput.QuoteContent.toRaw(), traits: UIAccessibilityTraitStaticText)
        tester.waitForViewWithAccessibilityLabel(TextInput.SceneDescription.toRaw(), traits: UIAccessibilityTraitStaticText)
    }
}



