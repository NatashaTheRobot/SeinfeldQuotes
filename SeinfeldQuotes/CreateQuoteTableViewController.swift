//
//  CreateQuoteTableViewController.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/10/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

let NewQuoteCreatedNotification = "NewQuoteCreatedNotification"

class CreateQuoteTableViewController: UITableViewController {

    private let quoteViewModel = QuoteViewModel()
    
    private let textCellIdentifier = "textInputCell"
    private let numberOfFields = 2
    
    private enum QuoteField: Int {
        case Content, Scene
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.hidesBarsOnSwipe = false
    }

    // MARK: Actions
    
    @IBAction func onSaveTap(sender: UIBarButtonItem) {
        if let quote = quoteViewModel.createQuote() {
            let newQuoteCreatedNotification = NSNotification(name: NewQuoteCreatedNotification, object: quote)
            NSNotificationCenter.defaultCenter().postNotification(newQuoteCreatedNotification)
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
        
        if let quoteField = QuoteField(rawValue: indexPath.row) {
            
            switch quoteField {
            case .Content:
                cell.configure(text: quoteViewModel.quoteContent,
                    placeholder: quoteViewModel.quoteContentPlaceholder,
                    textFieldChangedHandler: {[weak self] (newText) in
                        if let strongSelf = self {
                            strongSelf.quoteViewModel.quoteContent = newText
                        }
                })
            case .Scene:
                cell.configure(text: quoteViewModel.quoteScene,
                    placeholder: quoteViewModel.quoteScenePlaceholder,
                    textFieldChangedHandler: {[weak self] (newText) in
                        if let strongSelf = self {
                            strongSelf.quoteViewModel.quoteScene = newText
                        }
                })
            }
        }
        
        return cell
    }
}
