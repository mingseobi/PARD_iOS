//
//  NSMutableAttributedStringExtension.swift
//  PARD
//
//  Created by 진세진 on 3/13/24.
//

import UIKit

extension NSMutableAttributedString {
    func blueHighlight(_ value:String)
    -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font: UIFont.pardFont.body4,
            .foregroundColor: UIColor.pard.gra,
            .backgroundColor: UIColor.pard.blackCard
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func bold(string: String, fontSize: CGFloat , fontColor : UIColor)
    -> NSMutableAttributedString {
        let font = UIFont.pardFont.head2
        let color = fontColor
        let attributes: [NSAttributedString.Key: Any] = [.font: font , .foregroundColor : color ]
       self.append(NSAttributedString(string: string, attributes: attributes))
       return self
    }

    func regular(string: String, fontSize: CGFloat , fontColor : UIColor)
    -> NSMutableAttributedString {
        let font = UIFont.pardFont.body4
        let color = fontColor
        let attributes: [NSAttributedString.Key: Any] =
        [
            .font: font,
            .foregroundColor : color
        ]
       self.append(NSAttributedString(string: string, attributes: attributes))
       return self
    }
}
