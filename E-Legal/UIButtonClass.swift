//
//  UIButtonClass.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 18/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class UIButtonClass: UIButton {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Swift.print(frame.size.height)
        let size = UIScreen.mainScreen().bounds.width/414 * titleLabel!.font.pointSize
        titleLabel?.font = UIFont (name: titleLabel!.font.fontName, size:size)

    }
    override func setNeedsLayout() {
        super.setNeedsLayout()
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
