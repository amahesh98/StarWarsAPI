//
//  PeopleCellTableViewCell.swift
//  People
//
//  Created by Ashwin Mahesh on 7/16/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit

class PeopleCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
