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
    
    private lazy var normalButton = NormalButton(title: "normal Button", didTapHandler: normalButtonTapped).then{
        view.addSubview($0)
    }
    
    private lazy var changeNormalButton = NormalButton(title: "change normal button", didTapHandler: changeEnable).then{
        view.addSubview($0)
    }
    
    private lazy var titleLabel = UILabel().then{
        view.addSubview($0)
        $0.text = "< Test >"
        $0.font = displayLarge
        $0.textColor = .pard.primaryPurple
    }
    
    private func setUi() {
        titleLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        normalButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        changeNormalButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(normalButton.snp.bottom).offset(30)
            make.height.equalTo(48)
        }
    }
    
    @objc func normalButtonTapped() {
        print("🌱 normal tapped !")
    }
    
    @objc func changeEnable() {
        normalButton.isEnabled.toggle()
    }
}

