//
//  QuotesTableViewController.swift
//  SeinfeldQuotes
//
//  Created by Natasha Murashev on 9/8/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {

    private let quotes = Quote.allQuotes()
    private let quoteCellIdentifier = "quoteCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = true
        
        tableView.estimatedRowHeight = 89
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(quoteCellIdentifier) as TwoLabelTableViewCell
        
        let quote = quotes[indexPath.row]
        cell.configure(headerText: quote.content, subheadText: quote.scene)
        
        return cell

    }

}
