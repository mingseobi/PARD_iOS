//
//  HomeViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let topView = UIView().then { view in
        view.backgroundColor = .pard.blackCard
        view.layer.cornerRadius = 40
        view.layer.masksToBounds = true
    }
    
    private func setNavigation() {
        let homeButton = UIBarButtonItem(image: UIImage(named: "pardHomeLogo")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(homeLogoTapped))
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        flexibleSpace.width = 10
        self.navigationItem.leftBarButtonItem = homeButton
        self.navigationItem.rightBarButtonItems = [flexibleSpace,menuButton]
    }
    
    @objc private func homeLogoTapped() {
        print("home")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func menuButtonTapped() {
        print("sese")
        let menuBar = HamburgerBarViewController()
        menuBar.modalPresentationStyle = .overCurrentContext
        menuBar.modalTransitionStyle = .crossDissolve
        menuBar.didDismiss = { [weak self] in
            self?.tabBarController?.tabBar.isHidden = false
        }
    
        if let topViewController = UIApplication.shared.windows.first?.rootViewController {
                topViewController.present(menuBar, animated: true)
            }
    }
}

extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pard.blackBackground
        setUpUI()
        setNavigation()
    }
    
    private func setUpUI() {
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(377)
        }
    }
}


