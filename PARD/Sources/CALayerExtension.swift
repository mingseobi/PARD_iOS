//
//  CALayerExtension.swift
//  PARD
//
//  Created by 진세진 on 3/18/24.
//

import UIKit




extension CALayer {
    func addBorder(edges: [UIRectEdge], color: UIColor, thickness: CGFloat) {
        for edge in edges {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)

            case UIRectEdge.bottom:
                border.frame = CGRect(x:0, y: frame.height - thickness, width: frame.width, height:thickness)

            case UIRectEdge.left:
                border.frame = CGRect(x:0, y:0, width: thickness, height: frame.height)

            case UIRectEdge.right:
                border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)

            default: do {}
            }
            border.backgroundColor = color.cgColor
            addSublayer(border)
        }
    }
}
