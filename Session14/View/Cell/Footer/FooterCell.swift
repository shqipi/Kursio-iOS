//
//  FooterCell.swift
//  Session14
//
//  Created by shqiperimramadani on 27.03.23.
//

import UIKit

class FooterCell: UICollectionViewCell {
    
    @IBOutlet weak var footerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDetails(footer: Footer){
        footerButton.setImage(UIImage(systemName: footer.name), for: .normal)
    }

}
