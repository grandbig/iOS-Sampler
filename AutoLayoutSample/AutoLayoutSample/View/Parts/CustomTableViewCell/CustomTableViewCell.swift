//
//  CustomTableViewCell.swift
//  AutoLayoutSample
//
//  Created by Takahiro Kato on 2019/04/07.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var goodLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
