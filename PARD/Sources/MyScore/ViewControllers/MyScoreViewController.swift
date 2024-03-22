//
//  MyScoreViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit

class MyScoreViewController: UIViewController {

    let textLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setupTextLabel()

    }
    
    // Navigation 설정
    private func setNavigation() {
        self.navigationItem.title = "내 점수"
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [
                .font:  UIFont.pardFont.head1,
                .foregroundColor: UIColor.white
            ]
        }
        let backButton = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped(){
        print("go to back !!!")
    }
    
    private func setupTextLabel() {
        textLabel.text = " 🏆 PARDNERSHIP TOP 3 🏆 "
        textLabel.font = UIFont.pardFont.head2
        textLabel.textColor = UIColor(patternImage: gradientImage())
        textLabel.layer.borderWidth = 1
        textLabel.layer.borderColor = UIColor(patternImage: gradientImage()).cgColor
        textLabel.layer.cornerRadius = 18
        textLabel.textAlignment = .center
        
        view.addSubview(textLabel)
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(230)
            $0.height.equalTo(36)
        }
    }
    
    // 그라데이션 이미지 생성
    func gradientImage() -> UIImage {
        let gradientLayer = CAGradientLayer().then {
            $0.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
            $0.colors = [UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 1).cgColor, UIColor(red: 123/255, green: 63/255, blue: 239/255, alpha: 1).cgColor]
            $0.startPoint = CGPoint(x: 0, y: 0)
            $0.endPoint = CGPoint(x: 1, y: 1)
        }
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

}
