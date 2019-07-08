//
//  ViewController.swift
//  SuggestionView
//
//  Created by Macbook on 15/06/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SuggestionProtocol {
    var tableView = UITableView()
    var suggestionView = SuggestionView()
    var suggestionList: [(company: String, model: String)] = []
    var tableList: [(company: String, model: String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prepareArray()
        prepareUI()
    }
    
    func prepareArray() {
        suggestionList = [(company: "Honda", model: "Honda CD 110 Dream"),
                          (company: "Honda", model: "Honda CB Unicorn"),
                          (company: "TVS", model: "TVS Jupiter"),
                          (company: "TVS", model: "TVS Apache"),
                          (company: "Hero Moto Corp", model: "Hero Achiever"),
                          (company: "Hero Moto Corp", model: "Hero Passion Pro"),
                          (company: "Hero Moto Corp", model: "Hero HF Deluxe"),
                          (company: "Honda", model: "Honda Activa")]
    }
    
    func prepareUI() {
        prepareSuggestionView(tableView: &tableView, suggestionView: &suggestionView)
        tableView.dataSource = self
        suggestionView.customDataSource?.update(suggestions: suggestionList, nextURL: nil)
        suggestionView.customDelegate?.update(vc: self)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell
        cell?.descriptionLabel.text = "\(tableList[indexPath.row].company) \n\(tableList[indexPath.row].model)"
        return cell!
    }
}

extension ViewController: QECChatViewDelegateProtocol {
    func selectedSuggestion(indexPath: IndexPath) {
        tableList.append(suggestionList[indexPath.row])
        suggestionList.remove(at: indexPath.row)
        suggestionView.customDataSource?.update(suggestions: suggestionList, nextURL: nil)
        UIView.animate(withDuration: 0.2) {
            self.tableView.reloadData()
            self.suggestionView.reloadData()
        }
    }
}
