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
    let textLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .pard.blackBackground
        setNavigation()
        setupTextLabel()
        setupTableView()
    }

    private func setupTextLabel() {
        textLabel.text = "🏆 PARDNERSHIP 🏆"
        textLabel.font = UIFont.pardFont.head2
        textLabel.textColor = UIColor(patternImage: gradientImage())
        textLabel.layer.borderWidth = 1
        textLabel.layer.borderColor = UIColor(patternImage: gradientImage()).cgColor
        textLabel.layer.cornerRadius = 18
        textLabel.textAlignment = .center
        
        view.addSubview(textLabel)
        
        textLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
            $0.height.equalTo(36)
        }
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
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

    // Navigation 설정
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
    
    // 그라데이션 이미지 생성
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
            $0.backgroundColor = indexPath.row < 7 ? UIColor.pard.blackCard : .clear
            $0.selectionStyle = .none
            $0.contentView.layer.cornerRadius = 10
            $0.contentView.layer.masksToBounds = true
        }
        
        let rankView = UIView().then {
            $0.frame = CGRect(x: 22, y: 23, width: 40, height: 24) //오토레이아웃으로 설정
            $0.backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 0.1)
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = determineBorderColor(for: indexPath.row + 1).cgColor
        }
        cell.contentView.addSubview(rankView)
        
        if indexPath.row < userInfos.count {
            let userInfo = userInfos[indexPath.row]
            
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
            
            let userInfoLabel = UILabel().then {
                $0.text = "\(userInfo.name)"
                $0.textColor = .pard.gray10
                $0.font = UIFont.systemFont(ofSize: 16)
            }
            cell.contentView.addSubview(userInfoLabel)
            userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
            userInfoLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
            userInfoLabel.leadingAnchor.constraint(equalTo: rankView.trailingAnchor, constant: 8).isActive = true
            
            let userInfoPartLabel = UILabel().then {
                $0.text = "\(userInfo.part)"
                $0.textColor = .pard.gray30
                $0.font = UIFont.systemFont(ofSize: 12)
            }
            cell.contentView.addSubview(userInfoPartLabel)
            userInfoPartLabel.translatesAutoresizingMaskIntoConstraints = false
            userInfoPartLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
            userInfoPartLabel.leadingAnchor.constraint(equalTo: userInfoLabel.trailingAnchor, constant: 4).isActive = true
            
            let userInfoScoreLabel = UILabel().then {
                $0.text = "\(userInfo.score)"
                $0.textColor = .pard.gray10
                $0.font = UIFont.systemFont(ofSize: 12)
            }
            
            cell.contentView.addSubview(userInfoScoreLabel)
            userInfoScoreLabel.translatesAutoresizingMaskIntoConstraints = false
            userInfoScoreLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
            userInfoScoreLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16).isActive = true
        }
        
        let rankLabel = UILabel().then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = determineLabelColor(for: indexPath.row + 1)
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.text = "\(indexPath.row + 1)등"
        }
        rankView.addSubview(rankLabel)

        NSLayoutConstraint.activate([
            rankLabel.widthAnchor.constraint(equalToConstant: 40),
            rankLabel.heightAnchor.constraint(equalToConstant: 40),
            rankLabel.centerXAnchor.constraint(equalTo: rankView.centerXAnchor),
            rankLabel.centerYAnchor.constraint(equalTo: rankView.centerYAnchor, constant: 0)
        ])
        
        return cell
    }
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

