//
//  SuggestionViewDelegate.swift
//  ChatPOPPoC
//
//  Created by Rahul Patil on 29/05/19.
//  Copyright © 2019 D2KTech. All rights reserved.
//

import Foundation
import UIKit

protocol QECChatViewDelegateProtocol {
    func selectedSuggestion(indexPath: IndexPath)
}

class SuggestionViewDelegate: NSObject, UICollectionViewDelegate {
    private var getSelection: QECChatViewDelegateProtocol!

    func update(vc: QECChatViewDelegateProtocol) {
        getSelection = vc
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getSelection.selectedSuggestion(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let ncell = cell as? SuggestionCell
        ncell?.prepareCellUI()
        ncell?.layoutIfNeeded()
    }
}
