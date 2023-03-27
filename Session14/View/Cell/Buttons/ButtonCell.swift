//
//  ButtonCell.swift
//  Session14
//
//  Created by shqiperimramadani on 26.03.23.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    
    @IBOutlet weak var changeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDetails(button: Buttons) {
        changeButton.setImage(UIImage(systemName: button.name), for: .normal)
    }

}
