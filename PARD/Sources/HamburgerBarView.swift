//
//  HamburgerBarView.swift
//  PARD
//
//  Created by 진세진 on 3/5/24.
//

import UIKit

//hamburgerbar color , font
class HamburgerBarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .pard.blackCard
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(superview : UIView) {
        self.init()
        superview.addSubview(self)
        setUpHamburgerBarIntoSuperView()
    }
    
    private func setUpHamburgerBarIntoSuperView() {
        self.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(200)
            make.trailing.equalToSuperview()
        }
    }
}
