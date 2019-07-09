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
    var suggestionList: [(animalType: String, name: String)] = []
    var tableList: [(animalType: String, name: String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prepareArray()
        prepareUI()
    }
    
    func prepareArray() {
        suggestionList = [(animalType: "Invertebrates", name: "Octopus"),
                          (animalType: "Fish", name: "Shark"),
                          (animalType: "Amphibians", name: "Frog"),
                          (animalType: "Reptiles", name: "Crocodiles"),
                          (animalType: "Birds", name: "Eagle"),
                          (animalType: "Mammals", name: "Tiger")]
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
        cell?.descriptionLabel.text = "\(tableList[indexPath.row].name) \n\(tableList[indexPath.row].animalType)"
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
