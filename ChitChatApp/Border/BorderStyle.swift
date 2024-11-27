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
