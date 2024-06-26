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
        
        view.addSubview(feedbackView)
        feedbackView.addSubview(feedbackLabel)
        feedbackView.addSubview(feedbackActionLabel)
        
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
        
        view.addSubview(accountLabel)
        view.addSubview(accountView)
        accountView.addSubview(logoutLabel)
        accountView.addSubview(deleteAccountLabel)
        accountView.addSubview(arrowImageView3)
        accountView.addSubview(arrowImageView4)
    }

    
    private func setupConstraints() {
        myPageLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }

        feedbackView.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(76)
            make.top.equalTo(myPageLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        feedbackLabel.snp.makeConstraints { make in
            make.top.equalTo(feedbackView.snp.top).offset(16)
            make.leading.equalTo(feedbackView.snp.leading).offset(16)
            make.trailing.equalTo(feedbackActionLabel.snp.leading).offset(-10)
        }

        feedbackActionLabel.snp.makeConstraints { make in
            make.top.equalTo(feedbackView.snp.top).offset(16)
            make.trailing.equalTo(feedbackView.snp.trailing).offset(-16)
        }

        infoView.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(96)
            make.top.equalTo(feedbackView.snp.bottom).offset(20)
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
        
        accountLabel.snp.makeConstraints { make in
            make.top.equalTo(usageGuideView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(24)
        }
        
        accountView.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(100)
            make.top.equalTo(accountLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        logoutLabel.snp.makeConstraints { make in
            make.top.equalTo(accountView.snp.top).offset(16)
            make.leading.equalTo(accountView.snp.leading).offset(16)
        }
        
        deleteAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(logoutLabel.snp.bottom).offset(16)
            make.leading.equalTo(accountView.snp.leading).offset(16)
        }
        
        arrowImageView3.snp.makeConstraints { make in
            make.centerY.equalTo(logoutLabel)
            make.trailing.equalTo(accountView.snp.trailing).offset(-16)
        }
        
        arrowImageView4.snp.makeConstraints { make in
            make.centerY.equalTo(deleteAccountLabel)
            make.trailing.equalTo(accountView.snp.trailing).offset(-16)
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
    
    private let feedbackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()

    private let feedbackLabel: UILabel = {
        let label = UILabel()
        label.text = "운영진에게 전달하고 싶은 의견이 있나요?\n피드백 창구를 활용해보세요!"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let feedbackActionLabel: UILabel = {
        let label = UILabel()
        label.text = "피드백 남기기 >>"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    
    private let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.pard.primaryBlue.cgColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let infoLabel: UILabel = {
        let infolabel = UILabel()
        infolabel.text = "내 정보"
        infolabel.textColor = .white
        infolabel.textAlignment = .left
        infolabel.font = UIFont.pardFont.head1
        
        return infolabel
    }()
    
    private let statusLabel1: UILabel = {
        let label = UILabel()
        label.text = "2기"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.pardFont.body2
        label.backgroundColor = UIColor.pard.primaryBlue
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        
        return label
    }()
    
    private let statusLabel2: UILabel = {
        let label = UILabel()
        label.text = "디자인 파트"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.pardFont.body2
        label.backgroundColor = .pard.gra
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        
        return label
    }()
    
    private let statusLabel3: UILabel = {
        let label = UILabel()
        label.text = "거친파도"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.pardFont.body2
        label.backgroundColor = UIColor.pard.primaryPurple
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
        label.font = UIFont.pardFont.head1
        
        return label
    }()
        
    private let notificationSettingView: UIView = {
        let view = UIView()
        view.backgroundColor = .pard.blackCard
        view.layer.cornerRadius = 8
        return view
    }()
        
    private let notificationSettingLabel: UILabel = {
        let label = UILabel()
        label.text = "알림 설정"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.pardFont.body4
            
        return label
    }()
        
    private let notificationSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.onTintColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1)
        return toggleSwitch
    }()
    
    private let usageGuideLabel: UILabel = {
        let label = UILabel()
        label.text = "이용 안내"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.pardFont.head1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()

    private let usageGuideView: UIView = {
        let view = UIView()
        view.backgroundColor = .pard.blackCard
        view.layer.cornerRadius = 8
        return view
    }()

    private let privacyPolicyLabel: UILabel = {
        let label = UILabel()
        label.text = "개인정보 처리방침"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.pardFont.body4
        
        return label
    }()

    private let termsOfServiceLabel: UILabel = {
        let label = UILabel()
        label.text = "서비스 이용약관"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.pardFont.body4

        return label
    }()

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
    
    private let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "계정"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.pardFont.head1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()

    private let accountView: UIView = {
        let view = UIView()
        view.backgroundColor = .pard.blackCard
        view.layer.cornerRadius = 8
        return view
    }()

    private let logoutLabel: UILabel = {
        let label = UILabel()
        label.text = "로그아웃"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.pardFont.body4

        return label
    }()

    private let deleteAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "탈퇴하기"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.pardFont.body4

        return label
    }()

    private let arrowImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()

    private let arrowImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()


}
