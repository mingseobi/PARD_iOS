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
    var userInfos: [UserInfo] = PardAppModel.userInfos

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .pard.blackBackground
        setNavigation()
        
        let textLabel = UILabel().then {
            $0.text = "🏆PARDNERSHIP🏆"
            $0.font = UIFont.pardFont.head2
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
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
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
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
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
    
    private func setNavigation() {
        self.navigationItem.title = "전체 랭킹"
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
}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell").then {
            $0.textLabel?.text = rankings[indexPath.row]
            $0.textLabel?.textColor = .white
            $0.backgroundColor = indexPath.row < 7 ? UIColor.pard.blackCard : .clear
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
        
        if indexPath.row == 0 {
            let rankImageView = UIImageView().then {
                $0.frame = CGRect(x: 32, y: 8, width: 20, height: 20)
                $0.image = UIImage(named: "gold")
            }
            cell.contentView.addSubview(rankImageView)
        } else if indexPath.row == 1 {
            let rankImageView = UIImageView().then {
                $0.frame = CGRect(x: 32, y: 8, width: 20, height: 20)
                $0.image = UIImage(named: "silver")
            }
            cell.contentView.addSubview(rankImageView)
        } else if indexPath.row == 2 {
            let rankImageView = UIImageView().then {
                $0.frame = CGRect(x: 32, y: 8, width: 20, height: 20)
                $0.image = UIImage(named: "bronze")
            }
            cell.contentView.addSubview(rankImageView)
        }

        // Additional code to display name, part, and score
        let userInfo = userInfos[0] // Get user info from data model
        let userInfoLabel = UILabel().then {
            $0.text = "\(userInfo.name) \(userInfo.part) \(userInfo.score)"
            $0.textColor = .white
            $0.font = UIFont.systemFont(ofSize: 14) // Adjust font size as needed
        }
        cell.contentView.addSubview(userInfoLabel)
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        userInfoLabel.leadingAnchor.constraint(equalTo: rankView.trailingAnchor, constant: 8).isActive = true

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
