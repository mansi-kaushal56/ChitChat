//
//  BorderStyle.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import Foundation
import UIKit

class ViewGreyBorder: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderColor = UIColor(red: 233/255, green: 233/255, blue: 241/255, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 12
    }
}
class ViewBlueBorder: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderColor = UIColor.AppBlueClr?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 12
    }
}
class ViewPurpleBorder: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderColor = UIColor.AppPerpleClr?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 12
    }
}

