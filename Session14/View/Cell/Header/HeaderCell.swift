//
//  HeaderCell.swift
//  Session14
//
//  Created by shqiperimramadani on 27.03.23.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetailsNow(header: Header) {
        nameLabel.text = header.name
    }
    
}
