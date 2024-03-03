//
//  ViewController.swift
//  PARD
//
//  Created by 김하람 on 3/2/24.
//

import UIKit
import PARD_DesignSystem
import SnapKit
import Then

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pard.primaryGreen
        setUi()
    }
    
    private func setUi() {
        var titleLabel = UILabel().then{
            view.addSubview($0)
            $0.text = "< Test >"
            $0.font = displayLarge
            $0.textColor = .pard.primaryPurple
            $0.snp.makeConstraints{ make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }
    }
}

