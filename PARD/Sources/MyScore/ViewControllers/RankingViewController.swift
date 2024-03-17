//
//  RankingViewController.swift
//  PARD
//
//  Created by 김민섭 on 3/4/24.
//

import UIKit

class RankingViewController: UIViewController {
    let rankings = ["", "", "", "", "", "", ""]
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let titleLabel = UILabel().then {
            $0.text = "전체 랭킹"
            $0.font = UIFont(name: "Pretendard-Bold", size: 16)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        view.addSubview(titleLabel)
        
        let textLabel = UILabel().then {
            $0.text = "🏆PARDNERSHIP🏆"
            $0.font = UIFont(name: "Pretendard-Bold", size: 16)
            $0.textColor = UIColor(patternImage: gradientImage())
            $0.backgroundColor = UIColor(red: 82/255, green: 98/255, blue: 245/255, alpha: 0.1)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(patternImage: gradientImage()).cgColor
            $0.layer.cornerRadius = 18
            $0.textAlignment = .center
        }
        
        view.addSubview(textLabel)
        
        tableView.then {
            $0.backgroundColor = .clear
            $0.separatorStyle = .none
            $0.delegate = self
            $0.dataSource = self
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(104)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
            $0.height.equalTo(36)
        }
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
            $0.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
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

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell").then {
            $0.textLabel?.text = rankings[indexPath.row]
            $0.textLabel?.textColor = .white
            $0.backgroundColor = indexPath.row < 7 ? UIColor(red: 30/255, green: 40/255, blue: 50/255, alpha: 1) : .clear
            $0.selectionStyle = .none
            $0.contentView.layer.cornerRadius = 10
            $0.contentView.layer.masksToBounds = true
        }
        
        // 순위를 표시하는 뷰 추가
        let rankView = UIView().then {
            $0.frame = CGRect(x: 22, y: 12, width: 35, height: 24)
            $0.backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 0.1)
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1).cgColor
        }
        cell.contentView.addSubview(rankView)

        // 순위를 나타내는 라벨 추가
        let rankLabel = UILabel().then {
            $0.frame = CGRect(x: 1, y: 1, width: 32, height: 22)
            $0.textColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1) // #A3A3A3
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.text = "\(indexPath.row + 1)등"
        }
        rankView.addSubview(rankLabel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row < 6 {
            let separatorView = UIView()
            separatorView.backgroundColor = UIColor(red: 1/255, green: 123/255, blue: 50/255, alpha: 1)
            cell.contentView.addSubview(separatorView)
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            separatorView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            separatorView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
            separatorView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
    }
}
