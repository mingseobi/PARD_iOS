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
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.width.equalTo(180)
            $0.height.equalTo(36)
        }

        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
            $0.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.rowHeight = 68
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
        
        let rankView = UIView().then {
            $0.frame = CGRect(x: 22, y: 23, width: 40, height: 24)
            $0.backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 0.1)
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = determineBorderColor(for: indexPath.row + 1).cgColor
        }
        cell.contentView.addSubview(rankView)
        
        let rankImageView = UIImageView().then {
            $0.frame = CGRect(x: 32, y: 8, width: 20, height: 20)
            $0.image = UIImage(named: "gold")
        }
        cell.contentView.addSubview(rankImageView)

        let rankLabel = UILabel().then {
            $0.frame = CGRect(x: 0, y: -8, width: 40, height: 40)
            $0.textColor = determineLabelColor(for: indexPath.row + 1)
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.text = "\(indexPath.row + 1)등"
        }
        rankView.addSubview(rankLabel)

        return cell
    }




    private func determineBorderColor(for rank: Int) -> UIColor {
        switch rank {
        case 1:
            return UIColor(red: 252/255, green: 196/255, blue: 23/255, alpha: 1)
        case 2:
            return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        case 3:
            return UIColor(red: 247/255, green: 148/255, blue: 41/255, alpha: 1)
        default:
            return UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
        }
    }

    private func determineLabelColor(for rank: Int) -> UIColor {
        switch rank {
        case 1:
            return UIColor(red: 252/255, green: 196/255, blue: 23/255, alpha: 1)
        case 2:
            return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        case 3:
            return UIColor(red: 247/255, green: 148/255, blue: 41/255, alpha: 1)
        default:
            return UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
        }
    }


    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row < 6 {
            let separatorView = UIView()
            separatorView.backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
            cell.contentView.addSubview(separatorView)
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            separatorView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            separatorView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
            separatorView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
    }
}
