//
//  UILabelFontClass.swift
//  E-Legal
//
//  Created by Toqir Ahmad on 18/07/2016.
//  Copyright © 2016 Toqir Ahmad. All rights reserved.
//

import UIKit

class UILabelFontClass: UILabel {
    
    
    override func awakeFromNib() {
        let size = UIScreen.mainScreen().bounds.width/414 * font.pointSize
        font = UIFont(name: (font?.fontName)!, size:size)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
