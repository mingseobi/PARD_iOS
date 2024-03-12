//
//  UserInfoPolicyViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit
import PARD_DesignSystem
import Then
import SnapKit

// - MARK: 개인 정보 ViewController
class UserInfoPolicyViewController: UIViewController {
    private var isTapAgreeButton : Bool = false {
        didSet {
            if isTapAgreeButton {
                agreeButton.tintColor = UIColor.pard.primaryBlue
                agreeButton.setTitleColor(UIColor.pard.primaryBlue, for: .normal)
            } else {
                agreeButton.tintColor = UIColor.pard.gray30
                agreeButton.setTitleColor(UIColor.pard.gray10, for: .normal)
            }
        }
    }
    
    private let serviceInfoLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.backgroundColor = UIColor.pard.gray30
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.pard.gray10.cgColor
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }
    
    private let backButton = UIBarButtonItem().then {
        $0.image = UIImage(systemName: "chevron.backward")
        $0.tintColor = .white
    }
    
    private lazy var agreeButton = UIButton().then {
        let intervalSpacing = 4.0
        let halfIntervalSpacing = intervalSpacing / 2
        $0.setTitle("서비스 이용약관 전체 동의", for: .normal)
        $0.setTitleColor(UIColor.pard.white100, for: .normal)
        $0.setImage(
            UIImage(systemName: "checkmark.square.fill")?
            .withTintColor(UIColor.pard.gray30),
            for: .normal
        )
        $0.tintColor = UIColor.pard.gray10
        $0.semanticContentAttribute = .forceLeftToRight
        $0.contentEdgeInsets = .init(top: 0, left: 4.0 / 2, bottom: 0, right: 4.0)
        $0.imageEdgeInsets = .init(top: 0, left: -halfIntervalSpacing, bottom: 0, right: halfIntervalSpacing)
        $0.titleEdgeInsets = .init(top: 0, left: halfIntervalSpacing, bottom: 0, right: -halfIntervalSpacing)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(tapAgreeButton), for: .touchUpInside)
    }
    
    private let agreeView = UIView().then {
        $0.backgroundColor = UIColor.pard.gray30
        $0.layer.borderColor = UIColor.pard.gray10.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 16
        $0.layer.masksToBounds = true
    }
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .leading
    }
    

    private lazy var firstCheckAgreeButton = UIButton().then {
        configureButton(
            $0,
            title: "개인정보 수집및 이용동의(필수)",
            image: UIImage(systemName: "checkmark"),
            target: self ,
            action: #selector(firstTapCheckAgree)
        )
    }
    
    private lazy var nextBottomButton = BottomButton(title: "다음", didTapHandler: changeBottomEnable).then {
        view.addSubview($0)
        $0.layer.masksToBounds = true
    }
    
    private lazy var secondCheckAgreeButton = UIButton().then {
        configureButton(
            $0,
            title: "서비스 이용 약관(필수)",
            image: UIImage(systemName: "checkmark"),
            target: self ,
            action: #selector(secondTapCheckAgree)
        )
    }
    
    private lazy var checkImgaeButton = UIButton().then {
        $0.setTitle("서비스 이용약관 전체 동의", for: .normal)
        $0.setTitleColor(UIColor.pard.white100, for: .normal)
        $0.setImage(
            UIImage(systemName: "checkmark.square.fill")?
            .withTintColor(UIColor.pard.gray30),
            for: .normal
        )
        $0.semanticContentAttribute = .forceLeftToRight
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(tapAgreeButton), for: .touchUpInside)
    }
    
    private func setUpNavigaiton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.title = "이용약관"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        backButton.target = self
        backButton.action = #selector(tapBackButton)
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    private func setUpserviceInfoLabelText() {
        serviceInfoLabel.attributedText = NSMutableAttributedString()
            .regular(string: "서비스 이용 및 이용을 위해 \n", fontSize: 13, fontColor: UIColor.pard.gray10)
            .blueHighlight("서비스 이용약관")
            .regular(string: "에 동의하세요.", fontSize: 13, fontColor: UIColor.pard.gray10)
    }
    
    private func configureButton(_ button: UIButton, title: String, image: UIImage?, target: Any?, action: Selector) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.pardFont.caption1
        button.setUnderline()
        button.setTitleColor(UIColor.pard.gray10, for: .normal)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.pard.gray30
        button.semanticContentAttribute = .forceLeftToRight
        button.backgroundColor = .clear
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    @objc private func tapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func tapAgreeButton() {
        isTapAgreeButton.toggle()
    }
    
    @objc private func firstTapCheckAgree() {
    
    }
    
    @objc private func secondTapCheckAgree() {
        
    }
    
    @objc private func changeBottomEnable() {
        if isTapAgreeButton {
            nextBottomButton.backgroundColor = UIColor.pard.primaryPurple
            let viewController = ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            showToast(message: "서비스 이용약관에 동의해주세요.", font: UIFont.pardFont.body4)
            nextBottomButton.backgroundColor = UIColor.pard.gray30
        }
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel().then {
            $0.backgroundColor = UIColor.pard.blackBackground
            $0.textColor = UIColor.pard.primaryPurple
            $0.textAlignment = .center
            $0.alpha = 1.0
            $0.text = message
            $0.font = font
            $0.layer.borderColor = UIColor.pard.primaryPurple.cgColor
            $0.layer.borderWidth = 1.0
            $0.layer.cornerRadius = 10
            $0.clipsToBounds  =  true
        }
        view.addSubview(toastLabel)
        
        toastLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-150)
            make.width.equalTo(343)
            make.height.equalTo(40)
        }
        
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

// - MARK: setUp UI
extension UserInfoPolicyViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        view.backgroundColor = UIColor.pard.blackBackground
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(serviceInfoLabel)
        view.addSubview(agreeButton)
        view.addSubview(agreeView)
        agreeView.addSubview(stackView)
        view.addSubview(nextBottomButton)
        stackView.addArrangedSubview(firstCheckAgreeButton)
        stackView.addArrangedSubview(secondCheckAgreeButton)
        
        setUpNavigaiton()
        setUpserviceInfoLabelText()
        
        serviceInfoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(68)
            make.width.equalTo(327)
        }
        agreeButton.snp.makeConstraints { make in
            make.top.equalTo(serviceInfoLabel.snp.bottom).offset(48)
            make.leading.equalTo(serviceInfoLabel.snp.leading)
        }
        agreeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(agreeButton.snp.bottom).offset(10)
            make.height.equalTo(104)
            make.width.equalTo(327)
        }
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        nextBottomButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.width.equalTo(327)
            make.height.equalTo(56)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-80)
            
        }
    }
}

extension NSMutableAttributedString {
    func blueHighlight(_ value:String) 
    -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font: UIFont.pardFont.body4,
            .foregroundColor: UIColor.pard.primaryBlue,
            .backgroundColor: UIColor.pard.gray30
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func bold(string: String, fontSize: CGFloat , fontColor : UIColor)
    -> NSMutableAttributedString {
        let font = UIFont.pardFont.head2
        let color = fontColor
        let attributes: [NSAttributedString.Key: Any] = [.font: font , .foregroundColor : color ]
       self.append(NSAttributedString(string: string, attributes: attributes))
       return self
    }

    func regular(string: String, fontSize: CGFloat , fontColor : UIColor)
    -> NSMutableAttributedString {
        let font = UIFont.pardFont.body4
        let color = fontColor
        let attributes: [NSAttributedString.Key: Any] = 
        [
            .font: font,
            .foregroundColor : color
        ]
       self.append(NSAttributedString(string: string, attributes: attributes))
       return self
    }
}


extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
