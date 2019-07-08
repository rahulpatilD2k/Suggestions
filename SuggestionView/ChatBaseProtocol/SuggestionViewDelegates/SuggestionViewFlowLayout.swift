//
//  SuggestionViewFlowLayout.swift
//  ChatPOPPoC
//
//  Created by Rahul Patil on 29/05/19.
//  Copyright © 2019 D2KTech. All rights reserved.
//

import Foundation
import UIKit

class SuggestionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.estimatedItemSize = CGSize(width: 1, height: 1)
        self.scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
