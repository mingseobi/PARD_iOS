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
        view.backgroundColor = .pard.errorRed
        setUi()
    }
    
    private lazy var titleLabel = UILabel().then{
        view.addSubview($0)
        $0.text = "< Test >"
        $0.font = UIFont.pardFont.head2
        $0.textColor = .pard.primaryPurple
    }
    
    private lazy var normalButton = NormalButton(title: "normal Button", didTapHandler: normalButtonTapped).then{
        view.addSubview($0)
    }
    
    private lazy var changeNormalButton = NormalButton(title: "change normal button", didTapHandler: changeNormalEnable).then{
        view.addSubview($0)
    }
    
    private lazy var bottomButton = BottomButton(title: "bottom Button", didTapHandler: bottomButtonTapped).then{
        view.addSubview($0)
    }

    private lazy var changeBottomButton = BottomButton(title: "change bottom button", didTapHandler: changeBottomEnable).then{
        view.addSubview($0)
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
        
        bottomButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(changeNormalButton.snp.bottom).offset(30)
        }

        changeBottomButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(bottomButton.snp.bottom).offset(30)
            make.height.equalTo(48)
        }
    }
    
    @objc func normalButtonTapped() {
        print("🌱 normal tapped !")
        print("change normal !")
    }
    
    @objc func changeNormalEnable() {
        normalButton.isEnabled.toggle()
    }
    
    @objc func bottomButtonTapped() {
        print("🌱 bottom tapped !")
    }

    @objc func changeBottomEnable() {
        bottomButton.isEnabled.toggle()
        print("change Bottom !")
    }
}

