//
//  AppleLoginViewController.swift
//  PARD
//
//  Created by 김하람 on 3/9/24.
//

import UIKit
import AuthenticationServices
import SnapKit
import Then

class AppleLoginViewController: UIViewController {
    let authorizationAppleIDButton = ASAuthorizationAppleIDButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setComponents()
        configureUI()
    }
    
    private func setComponents() {
       
    }
    
    private func configureUI() {
        view.backgroundColor = .systemYellow
        setAdditionalPropertyAttributes()
        setConstraints()
    }
    
    private func setAdditionalPropertyAttributes() {
        authorizationAppleIDButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButton(_:)), for: .touchUpInside)
    }
    
    private func setConstraints() {
        view.addSubview(authorizationAppleIDButton)
        authorizationAppleIDButton.snp.makeConstraints { make in
            make.bottom.equalTo(-75)
            make.centerX.equalToSuperview()
            make.width.equalTo(268)
            make.height.equalTo(55)
        }
    }
    
    @objc private func handleAuthorizationAppleIDButton(_ sender: ASAuthorizationAppleIDButton) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
        controller.delegate = self
        controller.presentationContextProvider = self
    }
}

