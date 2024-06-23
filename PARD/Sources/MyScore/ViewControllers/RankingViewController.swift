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
        let horizontalPadding: CGFloat = 16

        let labelContainerView = UIView()
        labelContainerView.backgroundColor = .clear
        labelContainerView.layer.borderWidth = 1
        labelContainerView.layer.borderColor = UIColor(patternImage: gradientImage()).cgColor
        labelContainerView.layer.cornerRadius = 18
        view.addSubview(labelContainerView)

        textLabel.text = "🏆 PARDNERSHIP 🏆"
        textLabel.font = UIFont.pardFont.head2
        textLabel.textColor = UIColor(patternImage: gradientImage())
        textLabel.textAlignment = .center
        labelContainerView.addSubview(textLabel)

        labelContainerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180 + horizontalPadding * 2)
            $0.height.equalTo(36)
        }

        textLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(horizontalPadding)
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
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView.layer.masksToBounds = true
    }

    private func setNavigation() {
        self.navigationItem.title = "전체 랭킹"
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [
                .font:  UIFont.pardFont.head2,
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
            $0.contentView.layer.cornerRadius = 5
            $0.contentView.layer.masksToBounds = true
        }
        
        let rankView = UIView().then {
            $0.backgroundColor = UIColor.pard.blackCard
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = determineBorderColor(for: indexPath.row + 1).cgColor
        }
        cell.contentView.addSubview(rankView)
        
        rankView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rankView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 22),
            rankView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 23),
            rankView.widthAnchor.constraint(equalToConstant: 40),
            rankView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        let rankLabel = UILabel().then {
            $0.textColor = determineLabelColor(for: indexPath.row + 1)
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.text = "\(indexPath.row + 1)등"
        }
        
        rankView.addSubview(rankLabel)
        
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rankLabel.centerXAnchor.constraint(equalTo: rankView.centerXAnchor),
            rankLabel.centerYAnchor.constraint(equalTo: rankView.centerYAnchor),
        ])
        
        if indexPath.row < userInfos.count {
            let userInfo = userInfos[indexPath.row]
            
            let rankImageView = UIImageView()
            if indexPath.row == 0 {
                rankImageView.image = UIImage(named: "gold")
            } else if indexPath.row == 1 {
                rankImageView.image = UIImage(named: "silver")
            } else if indexPath.row == 2 {
                rankImageView.image = UIImage(named: "bronze")
            }
            
            if indexPath.row < 3 {
                cell.contentView.addSubview(rankImageView)
                rankImageView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    rankImageView.topAnchor.constraint(equalTo: rankView.topAnchor, constant: -14),
                    rankImageView.trailingAnchor.constraint(equalTo: rankView.trailingAnchor, constant: -9),
                    rankImageView.widthAnchor.constraint(equalToConstant: 20),
                    rankImageView.heightAnchor.constraint(equalToConstant: 20)
                ])
                cell.contentView.bringSubviewToFront(rankImageView)
            }
            
            let userInfoLabel = UILabel().then {
                $0.text = "\(userInfo.name)"
                $0.textColor = .pard.gray10
                $0.font = UIFont.systemFont(ofSize: 16)
            }
            cell.contentView.addSubview(userInfoLabel)
            userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                userInfoLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                userInfoLabel.leadingAnchor.constraint(equalTo: rankView.trailingAnchor, constant: 8)
            ])
            
            let userInfoPartLabel = UILabel().then {
                $0.text = "\(userInfo.part)"
                $0.textColor = .pard.gray30
                $0.font = UIFont.systemFont(ofSize: 12)
            }
            cell.contentView.addSubview(userInfoPartLabel)
            userInfoPartLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                userInfoPartLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                userInfoPartLabel.leadingAnchor.constraint(equalTo: userInfoLabel.trailingAnchor, constant: 4)
            ])
            
            let userInfoScoreLabel = UILabel().then {
                $0.text = "\(userInfo.score)"
                $0.textColor = .pard.gray10
                $0.font = UIFont.systemFont(ofSize: 12)
            }
            cell.contentView.addSubview(userInfoScoreLabel)
            userInfoScoreLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                userInfoScoreLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                userInfoScoreLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16)
            ])
        }

        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 각 셀마다 구분선을 추가하는 부분
        if indexPath.row < 6 {
            let separatorView = UIView()
            separatorView.backgroundColor = UIColor.pard.gray30
            cell.contentView.addSubview(separatorView)
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                separatorView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                separatorView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                separatorView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                separatorView.heightAnchor.constraint(equalToConstant: 1)
            ])
        }

        // 마지막 셀에 대한 처리
        if indexPath.row == rankings.count - 1 {
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
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
        return UIColor.pard.gray30
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
        return UIColor.pard.gray30
    }
}

