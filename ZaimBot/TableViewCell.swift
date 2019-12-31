//
//  TableViewCell.swift
//  ZaimBot
//
//  Created by Artyom Schiopu on 24.12.2019.
//  Copyright © 2019 Artyom Schiopu. All rights reserved.
//

import UIKit
import ActiveLabel
class TableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var messageLabel: ActiveLabel!
    
    @IBOutlet weak var msgLabel: ActiveLabel!
    @IBOutlet weak var testLabel: ActiveLabel!
    @IBOutlet weak var strethcingView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
