//
//  SuggestionViewDataSource.swift
//  ChatPOPPoC
//
//  Created by Rahul Patil on 29/05/19.
//  Copyright © 2019 D2KTech. All rights reserved.
//

import Foundation
import UIKit

class SuggestionViewDataSource: NSObject, UICollectionViewDataSource {
    private var suggestions: [(animalType: String, name: String)] = []
    private var nextURL: String?
    private var getSelection: QECChatViewDelegateProtocol!
    
    init(suggestions: [(animalType: String, name: String)]) {
        self.suggestions = suggestions
    }
    
    func initializeDelegate(vc: QECChatViewDelegateProtocol) {
        getSelection = vc
    }
    
    func update(suggestions: [(animalType: String, name: String)], nextURL: String?) {
        self.suggestions = suggestions
        self.nextURL = nextURL
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionCell", for: indexPath) as! SuggestionCell
        cell.prepareCellUI()
        cell.layoutIfNeeded()
        cell.title.text = suggestions[indexPath.item].name
        cell.layoutIfNeeded()
        return cell
    }
}
