//
//  TooltipView.swift
//  PARD
//
//  Created by 진세진 on 3/24/24.
//
import UIKit
import SnapKit

class TooltipBuilder {
    private var message: String = ""
    private var message2: String = ""
    private var message3 : String = ""
    private var font: UIFont = .systemFont(ofSize: 12)
    private var superview: UIView?
    private var isSelectedToolTip: Bool = false
    private var width: CGFloat = 343
    private var height: CGFloat = 40
    
    func setSuperView(_ superview : UIView) -> TooltipBuilder {
        self.superview = superview
        return self
    }
    
    func setMessage(_ message: String) -> TooltipBuilder {
        self.message = message
        return self
    }
    
    func setMessage2(_ message: String) -> TooltipBuilder {
        self.message2 = message
        return self
    }
    
    func setMessage3(_ message: String) -> TooltipBuilder {
        self.message3 = message
        return self
    }
    
    func setFont(_ font: UIFont) -> TooltipBuilder {
        self.font = font
        return self
    }
    
    func setSuperview(_ superview: UIView) -> TooltipBuilder {
        self.superview = superview
        return self
    }
    
    func setisToolTip(_ isSpeechBubbleForm: Bool) -> TooltipBuilder {
        self.isSelectedToolTip = isSpeechBubbleForm
        return self
    }
    
    func setWidth(_ width: CGFloat) -> TooltipBuilder {
        self.width = width
        return self
    }
    
    func setHeight(_ height: CGFloat) -> TooltipBuilder {
        self.height = height
        return self
    }
    
    func build() -> ToolTipBar {
        guard let superview = superview else {
            fatalError("Superview must be set.")
        }
        let toastBar = ToolTipBar(
            message: message,
            message2: message2,
            message3: message3,
            font: font,
            superview: superview,
            isSelected: isSelectedToolTip,
            width: width,
            height: height
        )
        return toastBar
    }
}

class ToolTipBar : UIView {
    private var isSelectedToolTip : Bool = false
    private var width : CGFloat?
    private var height : CGFloat?
    let toastLabel = UILabel().then {
        $0.backgroundColor = .pard.blackBackground
        $0.textColor = .pard.primaryPurple
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.alpha = 1.0
        $0.layer.borderColor = UIColor.pard.primaryPurple.cgColor
        $0.layer.borderWidth = 1.0
        $0.layer.cornerRadius = 8
        $0.clipsToBounds  =  true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpToastBarUIInSelfView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(
        message : String,
        message2 : String,
        message3 : String,
        font : UIFont,
        superview: UIView,
        isSelected : Bool,
        width: CGFloat,
        height: CGFloat
    ){
        self.init()
        self.toastLabel.attributedText = NSMutableAttributedString()
            .regular(string: message, fontSize: 6, fontColor: .pard.white100)
            .blueHighlight(message3, font: font)
            .regular(string: message2, fontSize: 6, fontColor: .pard.white100)
        
        self.toastLabel.font = font
        self.isSelectedToolTip = isSelected
        self.height = height
        self.width = width
        superview.addSubview(self)
    }
    
    private func setUpToastBarUIInSelfView() {
        self.addSubview(toastLabel)
        toastLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setUpToastBarUIInSuperView() {
        guard let superview = superview else {
            return
        }
        
        superview.addSubview(toastLabel)
        toastLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-150)
            make.width.equalTo(343)
            make.height.equalTo(40)
        }
        animateView()
        
    }
    
    func animateView() {
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            self.toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            self.removeFromSuperview()
        })
    }
    
    func setupSpeechBubbleView() {
        // - TODO: 말풍선 모양 만들기
    }
    
    func setUIToastLabel(questionimageView : UIButton) {
        print(isSelectedToolTip)
        if !isSelectedToolTip {
            removeFromSuperview()
        } else {
            guard let superview = superview else {
                return
            }
            addSubview(toastLabel)
            toastLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(questionimageView.snp.bottom).offset(5)
                make.width.equalTo(310)
                make.height.equalTo(64)
            }
        }
    }
}
