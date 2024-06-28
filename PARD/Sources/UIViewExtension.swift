//
//  +UIView.swift
//  PARD
//
//  Created by 진세진 on 6/27/24.
//

import UIKit

extension UIView {
    func roundCorners(corners : CACornerMask , radius : CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
}
