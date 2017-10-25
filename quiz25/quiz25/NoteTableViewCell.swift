//
//  NoteTableViewCell.swift
//  quiz25
//
//  Created by yusronadena on 10/25/17.
//  Copyright © 2017 yusron. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var labelPhoneMerk: UILabel!
    @IBOutlet weak var labelSeries: UILabel!
    @IBOutlet weak var labeltypePhone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
