//
//  TableViewCell.swift
//  SuggestionView
//
//  Created by Macbook on 15/06/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
