//
//  Font.swift
//  PARD
//
//  Created by 김하람 on 3/3/24.
//

import UIKit

extension UIFont {
    func withLineHeight(_ lineHeight: CGFloat) -> UIFont {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        return self
    }
}

let displayLarge = UIFont.systemFont(ofSize: 24, weight: .bold).withLineHeight(28)
let displayMedium = UIFont.systemFont(ofSize: 20, weight: .bold).withLineHeight(24)
let displaySmall = UIFont.systemFont(ofSize: 18, weight: .semibold).withLineHeight(24)

let headlineLarge = UIFont.systemFont(ofSize: 16, weight: .bold).withLineHeight(20)
let headlineMedium = UIFont.systemFont(ofSize: 16, weight: .semibold).withLineHeight(20)
let headlineSmall = UIFont.systemFont(ofSize: 14, weight: .semibold).withLineHeight(18)

let titleLarge = UIFont.systemFont(ofSize: 14, weight: .medium).withLineHeight(18)
let titleMedium = UIFont.systemFont(ofSize: 12, weight: .semibold).withLineHeight(16)
let titleSmall = UIFont.systemFont(ofSize: 12, weight: .medium).withLineHeight(16)
