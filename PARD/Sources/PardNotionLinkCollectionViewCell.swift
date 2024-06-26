//
//  PardNotionLinkTableViewCell.swift
//  PARD
//
//  Created by 진세진 on 3/20/24.
//

import UIKit
import SnapKit
import Then
import PARD_DesignSystem

class PardNotionLinkCollectionViewCell: UICollectionViewCell {
    
    let notionLabel = UILabel().then {
        $0.textAlignment = .left
        $0.textColor = .pard.gray30
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .pard.blackCard
        setUPNotionLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configuarePardNotionCell(partName notionPardName : String) {
        self.notionLabel.text = notionPardName
    }
    
    func setUPNotionLabel() {
        contentView.addSubview(notionLabel)
        
        notionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }
    }
    
    
}

