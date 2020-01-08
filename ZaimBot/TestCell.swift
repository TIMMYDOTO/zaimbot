//
//  TestCell.swift
//  ActiveLabel
//
//  Created by Artyom Schiopu on 27.12.2019.
//

import UIKit
import ActiveLabel
class TestCell: UITableViewCell {

    @IBOutlet weak var activeLabel: ActiveLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
