//
//  DetailTableViewCell.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var prix: UILabel!
    @IBOutlet weak var dateCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
