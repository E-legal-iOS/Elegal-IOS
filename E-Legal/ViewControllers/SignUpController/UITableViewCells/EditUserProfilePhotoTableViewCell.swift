//
//  EditUserProfilePhotoTableViewCell.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 27/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class EditUserProfilePhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var buttonEditUserImage: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonEditUserImage.layer.cornerRadius = buttonEditUserImage.frame.size.height / 2
        buttonEditUserImage.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
