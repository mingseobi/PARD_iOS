//
//  MyPageViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit

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
    
}
