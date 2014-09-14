//
//  CreateQuoteTableViewController.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/10/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class CreateQuoteTableViewController: UITableViewController {

    private let quoteViewModel = QuoteViewModel()
    
    private let textCellIdentifier = "textInputCell"
    private let numberOfFields = 2
    
    private enum QuoteField: Int {
        case Content, Scene
        
        func placeholder(#quoteViewModel: QuoteViewModel) -> String {
            switch self {
            case .Content:
                return quoteViewModel.quoteContentPlaceholder
            case .Scene:
                return quoteViewModel.quoteScenePlaceholder
            }
        }
        
        func text(#quoteViewModel: QuoteViewModel) -> String? {
            switch self {
            case .Content:
                return quoteViewModel.quoteContent
            case .Scene:
                return quoteViewModel.quoteScene
            }
        }
        
        func updateQuoteWithText(text: String, quoteViewModel: QuoteViewModel) {
            switch self {
            case .Content:
                quoteViewModel.quoteContent = text
            case .Scene:
                quoteViewModel.quoteScene = text
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.hidesBarsOnSwipe = false
    }

    // MARK: Actions
    
    @IBAction func onSaveTap(sender: UIBarButtonItem) {
        if let quote = quoteViewModel.createQuote() {
            // SAVE quote in your data store
            navigationController?.popViewControllerAnimated(true)
        } else {
            let alertController = UIAlertController(title: "All fields required", message: "Please make sure all fields are filled in to add the quote!", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: Table View Delegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfFields
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier) as TextInputTableViewCell
        
        if let quoteField = QuoteField.fromRaw(indexPath.row) {
            
            let text = quoteField.text(quoteViewModel: quoteViewModel)
            let placeholder = quoteField.placeholder(quoteViewModel: quoteViewModel)
            
            cell.configure(text: text, placeholder: placeholder, textFieldChangedHandler: { [weak self] (newText) in
                if let strongSelf = self {
                    quoteField.updateQuoteWithText(newText, quoteViewModel: strongSelf.quoteViewModel)
                }
            })
        }
        
        return cell
    }
}
