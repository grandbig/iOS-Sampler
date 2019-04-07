//
//  ThirdCustomTableViewCell.swift
//  AutoLayoutSample
//
//  Created by Takahiro Kato on 2019/04/07.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class ThirdCustomTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var prefixLabel: UILabel!
    @IBOutlet weak var atMarkLabel: UILabel!
    @IBOutlet weak var domainLabel: UILabel!
    @IBOutlet weak var prefixLabelMinWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var prefixLabelMaxWidthConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
