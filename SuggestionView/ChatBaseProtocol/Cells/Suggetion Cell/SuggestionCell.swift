//
//  SuggestionCell.swift
//  ChatViewDemo
//
//  Created by d2k technologies on 14/03/18.
//  Copyright © 2018 D2K Technologies. All rights reserved.
//

import UIKit

class SuggestionCell: UICollectionViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 12.0, *) {
            let leftConstraint = contentView.leftAnchor.constraint(equalTo: leftAnchor)
            let rightConstraint = contentView.rightAnchor.constraint(equalTo: rightAnchor)
            let topConstraint = contentView.topAnchor.constraint(equalTo: topAnchor)
            let bottomConstraint = contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            NSLayoutConstraint.activate([leftConstraint, rightConstraint, topConstraint, bottomConstraint])
        }
    }

    func prepareCellWith(title: String) {
        self.title.text = title
        layoutIfNeeded()
        parentView.layer.borderColor = UIColor.lightGray.cgColor
        parentView.layer.borderWidth = 1.0
        parentView.layer.cornerRadius = self.parentView.frame.height/2
    }
    
    func prepareCellUI() {
        layoutIfNeeded()
        DispatchQueue.main.async {
            self.parentView.layer.borderColor = UIColor.lightGray.cgColor
            self.parentView.layer.borderWidth = 1.0
            self.parentView.layer.cornerRadius = self.parentView.frame.height/2
        }
    }
}
