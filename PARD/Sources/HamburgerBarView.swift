//
//  HamburgerBarView.swift
//  PARD
//
//  Created by 진세진 on 3/5/24.
//

import UIKit

class HamburgerBarView: UIView {
    private let identifierInTableView = "menuTableView"
    private lazy var menuTableView = UITableView().then { tableView in
        tableView.backgroundColor = .pard.blackCard
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: identifierInTableView)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .pard.blackCard
        setUpUIInView()
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HamburgerBarView {
    convenience init(superview : UIView) {
        self.init()
        superview.addSubview(self)
        setUpUIIntoSuperView()
    }
    
    private func setUpUIIntoSuperView() {
        self.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(200)
            make.trailing.equalToSuperview()
        }
    }
    
    private func setUpUIInView() {
        self.addSubview(menuTableView)
       
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension HamburgerBarView : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuTable.menuTableModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuTable.menuTableModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierInTableView, for: indexPath) as? MenuTableViewCell  else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.layer.addBorder(edges: [.bottom], color: .pard.gray30, thickness: 1)
        let menu = MenuTable.menuTableModel[indexPath.section][indexPath.row]
        cell.delegate = self
        if indexPath.row == 0 && indexPath.section == 0 {
            cell.configureCell(text: menu.subtitle, image: menu.imageNamed, isHiddenButton: false)
        } else {
            cell.configureCell(text: menu.subtitle, image: menu.imageNamed, isHiddenButton: true)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        customView.configureLabel(title: MenuTable.menuTableModel[section][0].title)
        customView.layer.addBorder(edges: [.bottom], color: .pard.gray30, thickness: 1)
        return customView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
}
// - MARK: HamburgerBarView 
extension HamburgerBarView : MenuTableViewCellButtonTapedDelegate {
    func cellButtonTaped() {
        print("tapped")
    }
}


// - MARK: HamburgerBar HeaderView
class HeaderView : UIView {
    private let label = UILabel().then { label in
        label.textColor = .pard.gra
        label.textAlignment = .center
        label.textColor = .pard.gra
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .pard.blackCard
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureLabel(title : String) {
        label.text = title
    }
    
    private func setUpUI() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(20)
        }
    }
}

// - MARK: MenuTable 모델
struct MenuTable {
    let title : String
    let subtitle : String
    let imageNamed : String
}

extension MenuTable {
   static let menuTableModel =  [
        [
            MenuTable(title: "공지 및 자료", subtitle: "PARD 노션", imageNamed: "notion")
        ],
        [
            MenuTable(title: "피드백", subtitle: "세미나 구글폼", imageNamed: "googleForm")
        ],
        [
            MenuTable(title: "공식채널", subtitle: "인스타 그램", imageNamed: "instargram"),
            MenuTable(title: "공식채널", subtitle: "웹 사이트", imageNamed: "pardLogoInMenu")
        ]
   ]
}

