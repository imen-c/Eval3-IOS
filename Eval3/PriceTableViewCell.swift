//
//  PriceTableViewCell.swift
//  Eval3
//
//  Created by Student04 on 12/08/2021.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    @IBOutlet weak var numerotation: UILabel!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var dollar: UILabel!
    @IBOutlet weak var pourcent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openWeb(_ sender: Any) {
    }
}
