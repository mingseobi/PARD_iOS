//
//  MainLoginViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit
import PARD_DesignSystem

class MainLoginViewController: UIViewController {
    private let semiTitleLabel = UILabel().then {
        $0.font = UIFont.pardFont.body3
        $0.textColor = UIColor.pard.gray10
        $0.text =  "Pay it Forward를 실천하는 IT 협업 동아리"
        $0.textAlignment = .center
    }
    
    private let pardLabelImageView = UIImageView().then {
        $0.image = UIImage(named: "pardMainLogo")
    }
    
    private let pardMainImageView = UIImageView().then {
        $0.image = UIImage(named: "pardMainLogin")
    }
    
    private lazy var googleLoginButton = BottomButton(title: "구글로 로그인 하기", didTapHandler: tapGoogleLogin).then {
        view.addSubview($0)
    }
    
    private lazy var appleLoginButton = BottomButton(title: "애플로 로그인 하기", didTapHandler: tapAppleLogin).then {
        view.addSubview($0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(semiTitleLabel)
        view.addSubview(pardLabelImageView)
        view.addSubview(pardMainImageView)
        
        semiTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(146)
        }
        
        pardLabelImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(semiTitleLabel.snp.bottom).offset(12)
        }
        pardMainImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        googleLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pardMainImageView.snp.bottom).offset(90)
            make.height.equalTo(56)
            make.width.equalTo(327)
        }
        appleLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(googleLoginButton.snp.bottom).offset(16)
            make.height.equalTo(56)
            make.width.equalTo(327)
        }
    }
    
    @objc private func tapGoogleLogin() {
        let userInfoViewController = UserInfoPolicyViewController()
        navigationController?.pushViewController(userInfoViewController, animated: true)
    }
    
    @objc private func tapAppleLogin() {
        let userInfoViewController = UserInfoPolicyViewController()
        navigationController?.pushViewController(userInfoViewController, animated: true)
    }
    
}
