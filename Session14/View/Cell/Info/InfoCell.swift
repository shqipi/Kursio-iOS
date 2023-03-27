//
//  InfoCell.swift
//  Session14
//
//  Created by shqiperimramadani on 27.03.23.
//

import UIKit

class InfoCell: UITableViewCell {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var postsNumberLabel: UILabel!
    @IBOutlet weak var postsNameLabel: UILabel!
    @IBOutlet weak var followersNumberLabel: UILabel!
    @IBOutlet weak var followersNameLabel: UILabel!
    @IBOutlet weak var followingNumberLabel: UILabel!
    @IBOutlet weak var followingNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var seeLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addToolsButton: UIButton!
    @IBOutlet weak var insightsButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setImage()
        setButtons()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage() {
        topImage.layer.cornerRadius = topImage.frame.width / 2
        topImage.layer.borderWidth = 1
        topImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setButtons() {
        editButton.layer.cornerRadius = 5
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        
        addToolsButton.layer.cornerRadius = 5
        addToolsButton.layer.borderWidth = 1
        addToolsButton.layer.borderColor = UIColor.lightGray.cgColor
        
        insightsButton.layer.cornerRadius = 5
        insightsButton.layer.borderWidth = 1
        insightsButton.layer.borderColor = UIColor.lightGray.cgColor
        
        emailButton.layer.cornerRadius = 5
        emailButton.layer.borderWidth = 1
        emailButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    func setDetails(info: Info) {
        postsNumberLabel.text = "\(info.postNumberLabel)"
        postsNameLabel.text = info.postNameLabel
        followersNumberLabel.text = "\(info.followerNumberLabel)"
        followersNameLabel.text = info.followerNameLabel
        followingNumberLabel.text = "\(info.followingNumberLabel)"
        followingNameLabel.text = info.followingNameLabel
        titleLabel.text = info.titleLabel
        firstLabel.text = info.firstLabel
        secondLabel.text = info.secondLabel
        thirdLabel.text = info.thirdLabel
        linkLabel.text = info.linkLabel
        seeLabel.text = info.seeLabel
    }
}
