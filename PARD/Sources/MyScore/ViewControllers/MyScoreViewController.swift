//
//  MyScoreViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit

class MyScoreViewController: UIViewController {

    let pardnerShipLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pard.blackBackground

        setNavigation()
        setupTextLabel()
        setupRankingMedals()
        setupRankingButton()
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
        pardnerShipLabel.text = " 🏆 PARDNERSHIP TOP 3 🏆 "
        pardnerShipLabel.font = UIFont.pardFont.head2
        pardnerShipLabel.textColor = UIColor(patternImage: gradientImage())
        pardnerShipLabel.layer.borderWidth = 1
        pardnerShipLabel.layer.borderColor = UIColor(patternImage: gradientImage()).cgColor
        pardnerShipLabel.layer.cornerRadius = 18
        pardnerShipLabel.textAlignment = .center
        
        view.addSubview(pardnerShipLabel)
        
        pardnerShipLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(230)
            $0.height.equalTo(36)
        }
    }
    
    // "전체랭킹 확인하기" 버튼 추가 및 액션 설정
    private func setupRankingButton() {
        let rankingButton = UIButton(type: .system).then {
            $0.setTitle("전체랭킹 확인하기", for: .normal)
            $0.setTitleColor(.pard.gray30, for: .normal)
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(rankingButtonTapped), for: .touchUpInside)
        }
        view.addSubview(rankingButton)
        
        rankingButton.snp.makeConstraints {
            $0.top.equalTo(pardnerShipLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
    
    // 메달 형식의 랭킹을 나타내는 함수
    private func setupRankingMedals() {
        // Gold Medal
        let goldRingImageView = UIImageView(image: UIImage(named: "goldRing"))
        view.addSubview(goldRingImageView)
        
        let goldRankLabel = UILabel().then {
            $0.text = "1"
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            $0.textAlignment = .center
            $0.textColor = .pard.gray10
        }
        view.addSubview(goldRankLabel)
        
        let goldPartLabel = UILabel().then {
            $0.text = "디자인파트"
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textAlignment = .center
            $0.textColor = .pard.gray30
        }
        view.addSubview(goldPartLabel)
        
        let goldNameLabel = UILabel().then {
            $0.text = "김민섭"
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textAlignment = .center
            $0.textColor = .pard.gray30
        }
        view.addSubview(goldNameLabel)
        
        // Silver Medal
        let silverRingImageView = UIImageView(image: UIImage(named: "silverRing"))
        view.addSubview(silverRingImageView)
        
        let silverRankLabel = UILabel().then {
            $0.text = "2"
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            $0.textAlignment = .center
            $0.textColor = .pard.gray10
        }
        view.addSubview(silverRankLabel)
        
        let silverPartLabel = UILabel().then {
            $0.text = "웹파트"
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textAlignment = .center
            $0.textColor = .pard.gray30
        }
        view.addSubview(silverPartLabel)
        
        let silverNameLabel = UILabel().then {
            $0.text = "손동우"
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textAlignment = .center
            $0.textColor = .pard.gray30
        }
        view.addSubview(silverNameLabel)
        
        // Bronze Medal
        let bronzeRingImageView = UIImageView(image: UIImage(named: "bronzeRing"))
        view.addSubview(bronzeRingImageView)
        
        let bronzeRankLabel = UILabel().then {
            $0.text = "3"
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            $0.textAlignment = .center
            $0.textColor = .pard.gray10
        }
        view.addSubview(bronzeRankLabel)
        
        let bronzePartLabel = UILabel().then {
            $0.text = "기획파트"
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textAlignment = .center
            $0.textColor = .pard.gray30
        }
        view.addSubview(bronzePartLabel)
        
        let bronzeNameLabel = UILabel().then {
            $0.text = "윤성익"
            $0.font = UIFont.systemFont(ofSize: 16)
            $0.textAlignment = .center
            $0.textColor = .pard.gray30
        }
        view.addSubview(bronzeNameLabel)
        
        // Constraints 설정
        
        // Gold Medal Constraints
        goldRingImageView.snp.makeConstraints {
            $0.top.equalTo(pardnerShipLabel.snp.bottom).offset(25) // 변경된 부분
            $0.leading.equalToSuperview().offset(22) // 변경된 부분
            $0.width.height.equalTo(40)
        }

        goldRankLabel.snp.makeConstraints {
            $0.centerX.equalTo(goldRingImageView)
            $0.centerY.equalTo(goldRingImageView).offset(-5) // 변경된 부분
        }

        goldPartLabel.snp.makeConstraints {
            $0.centerX.equalTo(goldRingImageView) // 변경된 부분
            $0.top.equalTo(goldRingImageView.snp.bottom).offset(8) // 변경된 부분
        }

        goldNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(goldRingImageView) // 변경된 부분
            $0.top.equalTo(goldPartLabel.snp.bottom).offset(4)
        }
        
        // Silver Medal Constraints
        silverRingImageView.snp.makeConstraints {
            $0.centerY.equalTo(goldRingImageView)
            $0.leading.equalToSuperview().offset(138) // 변경된 부분
            $0.width.height.equalTo(40)
        }
        
        silverRankLabel.snp.makeConstraints {
            $0.centerX.equalTo(silverRingImageView)
            $0.centerY.equalTo(silverRingImageView)
        }
        
        silverPartLabel.snp.makeConstraints {
            $0.leading.equalTo(silverRingImageView.snp.trailing).offset(8) // 변경된 부분
            $0.centerY.equalTo(silverRingImageView)
        }
        
        silverNameLabel.snp.makeConstraints {
            $0.leading.equalTo(silverRingImageView.snp.trailing).offset(8) // 변경된 부분
            $0.top.equalTo(silverPartLabel.snp.bottom).offset(4)
        }
        
        // Bronze Medal Constraints
        bronzeRingImageView.snp.makeConstraints {
            $0.centerY.equalTo(goldRingImageView)
            $0.leading.equalToSuperview().offset(254) // 변경된 부분
            $0.width.height.equalTo(40)
        }
        
        bronzeRankLabel.snp.makeConstraints {
            $0.centerX.equalTo(bronzeRingImageView)
            $0.centerY.equalTo(bronzeRingImageView)
        }
        
        bronzePartLabel.snp.makeConstraints {
            $0.leading.equalTo(bronzeRingImageView.snp.trailing).offset(8) // 변경된 부분
            $0.centerY.equalTo(bronzeRingImageView)
        }
        
        bronzeNameLabel.snp.makeConstraints {
            $0.leading.equalTo(bronzeRingImageView.snp.trailing).offset(8) // 변경된 부분
            $0.top.equalTo(bronzePartLabel.snp.bottom).offset(4)
        }
    }
    
    @objc private func rankingButtonTapped() {
        let rankingViewController = RankingViewController()
        navigationController?.pushViewController(rankingViewController, animated: true)
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
