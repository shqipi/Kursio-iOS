//
//  HighlightCell.swift
//  Session14
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit

class HighlightCell: UICollectionViewCell {
    @IBOutlet weak var highlightImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        highlightImageView.layer.cornerRadius = highlightImageView.frame.width / 2
        highlightImageView.layer.borderWidth = 1
        highlightImageView.layer.borderColor = UIColor.lightGray.cgColor
    }

    func setDetals(heighlight: Heighlight) {
        highlightImageView.image = UIImage(named: heighlight.image)
        nameLabel.text = heighlight.name
    }
}
