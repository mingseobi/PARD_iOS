//
//  MyPageViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit
import PARD_DesignSystem

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(myPageLabel)
        view.addSubview(infoView)
        view.addSubview(infoLabel)
        view.addSubview(statusLabel1)
        view.addSubview(statusLabel2)
        view.addSubview(statusLabel3)
        view.addSubview(nameLabel)
        view.addSubview(settingsLabel)
        view.addSubview(notificationSettingView)
        notificationSettingView.addSubview(notificationSettingLabel)
        notificationSettingView.addSubview(notificationSwitch)
        view.addSubview(usageGuideLabel)
        view.addSubview(usageGuideView)
        usageGuideView.addSubview(privacyPolicyLabel)
        usageGuideView.addSubview(termsOfServiceLabel)
        usageGuideView.addSubview(arrowImageView1)
        usageGuideView.addSubview(arrowImageView2)
    }
    
    private func setupConstraints() {
        myPageLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(96)
            make.top.equalTo(myPageLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(infoView.snp.top).offset(-8)
            make.leading.equalTo(infoView.snp.leading)
        }
        
        statusLabel1.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(8)
            make.leading.equalTo(infoView.snp.leading).offset(16)
            make.height.equalTo(24)
        }
        
        statusLabel2.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(8)
            make.leading.equalTo(statusLabel1.snp.trailing).offset(8)
            make.height.equalTo(24)
        }
        
        statusLabel3.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(8)
            make.leading.equalTo(statusLabel2.snp.trailing).offset(8)
            make.height.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(statusLabel1.snp.bottom).offset(8)
            make.leading.equalTo(infoView.snp.leading).offset(16)
            make.bottom.equalTo(infoView.snp.bottom).offset(-8)
        }
        
        settingsLabel.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(24)
        }
        
        notificationSettingView.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(60)
            make.top.equalTo(settingsLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        notificationSettingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(notificationSettingView)
            make.leading.equalTo(notificationSettingView.snp.leading).offset(16)
        }
        
        notificationSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(notificationSettingLabel.snp.centerY)
            make.trailing.equalTo(notificationSettingView.snp.trailing).offset(-16)
        }
        
        usageGuideLabel.snp.makeConstraints { make in
            make.top.equalTo(notificationSettingView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(24)
        }
        
        usageGuideView.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(100)
            make.top.equalTo(usageGuideLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        privacyPolicyLabel.snp.makeConstraints { make in
            make.top.equalTo(usageGuideView.snp.top).offset(16)
            make.leading.equalTo(usageGuideView.snp.leading).offset(16)
        }
        
        termsOfServiceLabel.snp.makeConstraints { make in
            make.top.equalTo(privacyPolicyLabel.snp.bottom).offset(16)
            make.leading.equalTo(usageGuideView.snp.leading).offset(16)
        }
        
        arrowImageView1.snp.makeConstraints { make in
            make.centerY.equalTo(privacyPolicyLabel)
            make.trailing.equalTo(usageGuideView.snp.trailing).offset(-16)
        }
        
        arrowImageView2.snp.makeConstraints { make in
            make.centerY.equalTo(termsOfServiceLabel)
            make.trailing.equalTo(usageGuideView.snp.trailing).offset(-16)
        }
    }
    
    private let myPageLabel: UILabel = {
        let myPageLabel = UILabel()
        myPageLabel.text = "마이 페이지"
        myPageLabel.textColor = .white
        myPageLabel.font = UIFont.pardFont.head2
        myPageLabel.font = UIFont.boldSystemFont(ofSize: 16)
        myPageLabel.textAlignment = .center
        
        return myPageLabel
    }()
    
    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1).cgColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let infoLabel: UILabel = {
        let infolabel = UILabel()
        infolabel.text = "내 정보"
        infolabel.textColor = .white
        infolabel.textAlignment = .left
        infolabel.font = UIFont.pardFont.head1
        infolabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        return infolabel
    }()
    
    private let statusLabel1: UILabel = {
        let label = UILabel()
        label.text = "2기"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.backgroundColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1)
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    private let statusLabel2: UILabel = {
        let label = UILabel()
        label.text = "디자인 파트"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.backgroundColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1)
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    private let statusLabel3: UILabel = {
        let label = UILabel()
        label.text = "거친파도"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.backgroundColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1)
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "김파드 님"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "설정"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
        
    private let notificationSettingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 42/255, green: 42/255, blue: 42/255, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
        
    private let notificationSettingLabel: UILabel = {
        let label = UILabel()
        label.text = "알림 설정"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
        
    private let notificationSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.onTintColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1)
        return toggleSwitch
    }()
    
    // 이용 안내 라벨 정의
    private let usageGuideLabel: UILabel = {
        let label = UILabel()
        label.text = "이용 안내"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    // 이용 안내 뷰 정의
    private let usageGuideView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 42/255, green: 42/255, blue: 42/255, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()

    // 개인정보 처리방침 라벨 정의
    private let privacyPolicyLabel: UILabel = {
        let label = UILabel()
        label.text = "개인정보 처리방침"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    // 서비스 이용약관 라벨 정의
    private let termsOfServiceLabel: UILabel = {
        let label = UILabel()
        label.text = "서비스 이용약관"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    // 화살표 이미지 정의
    private let arrowImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()

    private let arrowImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()

}
