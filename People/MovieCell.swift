//
//  MovieCell.swift
//  People
//
//  Created by Ashwin Mahesh on 7/16/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var crawlLabel: UITextView!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
