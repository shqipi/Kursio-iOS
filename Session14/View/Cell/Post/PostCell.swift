//
//  PostCell.swift
//  Session14
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setDetails(post: Post) {
        postImageView.image = UIImage(named: post.image ?? "2")
    }
}
