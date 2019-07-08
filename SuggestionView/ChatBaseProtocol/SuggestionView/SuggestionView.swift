//
//  SuggestionView.swift
//  ChatPOPPoC
//
//  Created by Rahul Patil on 29/05/19.
//  Copyright © 2019 D2KTech. All rights reserved.
//

import Foundation
import UIKit

class SuggestionView: UICollectionView {
    var customDelegate: SuggestionViewDelegate?
    var customDataSource: SuggestionViewDataSource?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = SuggestionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: flowLayout)
        customDataSource = SuggestionViewDataSource(suggestions: [])
        self.dataSource = customDataSource
        
        customDelegate = SuggestionViewDelegate()
        self.delegate = customDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
