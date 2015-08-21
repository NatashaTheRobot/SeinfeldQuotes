//
//  QuotesTableViewController.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/8/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {

    private var quotes = Quote.allQuotes()
    private let quoteCellIdentifier = "quoteCell"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onQuoteCreatedNotification:",
            name: NewQuoteCreatedNotification,
            object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.estimatedRowHeight = 89
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(quoteCellIdentifier) as! TwoLabelTableViewCell
        
        let quote = quotes[indexPath.row]
        cell.configure(headerText: quote.content, subheadText: quote.scene)
        
        return cell

    }
    
    // MARK: Notification Handler
    
    func onQuoteCreatedNotification(notification: NSNotification) {
        if let newQuote = notification.object as? Quote {
            quotes.insert(newQuote, atIndex: 0)
            tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Automatic)
        }
    }
    

}
