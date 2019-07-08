//
//  SuggestionProtocol.swift
//  SuggestionView
//
//  Created by Macbook on 17/06/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import Foundation
import UIKit

protocol SuggestionProtocol {
    func prepareSuggestionView(tableView: inout UITableView, suggestionView: inout SuggestionView)
}

extension SuggestionProtocol where Self: UIViewController {
    func prepareSuggestionView(tableView: inout UITableView, suggestionView: inout SuggestionView) {
        self.view.addSubview(tableView)
        
        self.view.addSubview(suggestionView)
        suggestionView.backgroundColor = UIColor.gray
        suggestionView.register(UINib(nibName: "SuggestionCell", bundle: nil) , forCellWithReuseIdentifier: "SuggestionCell")
        suggestionView.translatesAutoresizingMaskIntoConstraints = false
        let suggestionTopToViewTopMargin = NSLayoutConstraint(item: suggestionView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 0)
        let suggestionLeadingToViewLeading = NSLayoutConstraint(item: suggestionView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let suggestionTrailingToViewTrailing = NSLayoutConstraint(item: suggestionView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        let suggestionHeight = NSLayoutConstraint(item: suggestionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        self.view.addConstraints([suggestionTopToViewTopMargin, suggestionLeadingToViewLeading, suggestionTrailingToViewTrailing, suggestionHeight])

        tableView.register(UINib(nibName: "TableCell", bundle: nil) , forCellReuseIdentifier: "TableCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableTopToSuggestionBottom = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: suggestionView, attribute: .bottom, multiplier: 1, constant: 0)
        let tableLeadingToViewLeading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let tableTrailingToViewTrailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let tableBottomToViewBottomMargin = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0)
        self.view.addConstraints([tableTopToSuggestionBottom, tableLeadingToViewLeading, tableTrailingToViewTrailing, tableBottomToViewBottomMargin])
    }
}
