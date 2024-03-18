//
//  ReaderViewController.swift
//  PARD
//
//  Created by 김하람 on 3/17/24.
//

import UIKit
import AVFoundation

class ReaderViewController: UIViewController {
    
    var readerView: QrReaderView!
    var readButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        readerView = QrReaderView()
        readerView.delegate = self
        readerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(readerView)
        
        readButton = UIButton(type: .system)
        readButton.setTitle("Scan", for: .normal)
        readButton.addTarget(self, action: #selector(scanButtonAction(_:)), for: .touchUpInside)
        readButton.layer.masksToBounds = true
        readButton.layer.cornerRadius = 15
        readButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(readButton)
        setupLayouts()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if !readerView.isRunning {
            readerView.stop(isButtonTap: false)
        }
    }
    
    @objc func scanButtonAction(_ sender: UIButton) {
        if readerView.isRunning {
            readerView.stop(isButtonTap: true)
        } else {
            readerView.start()
        }
        
        sender.isSelected = readerView.isRunning
    }
    
    func setupLayouts() {
        NSLayoutConstraint.activate([
            readerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            readerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            readerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            readerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            readButton.topAnchor.constraint(equalTo: readerView.bottomAnchor, constant: 20),
            readButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            readButton.widthAnchor.constraint(equalToConstant: 100),
            readButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ReaderViewController: ReaderViewDelegate {
    func readerComplete(status: ReaderStatus) {

        var title = ""
        var message = ""
        switch status {
        case let .success(code):
            guard let code = code else {
                title = "에러"
                message = "QR코드 or 바코드를 인식하지 못했습니다.\n다시 시도해주세요."
                break
            }

            title = "알림"
            message = "인식성공\n\(code)"
        case .fail:
            title = "에러"
            message = "QR코드 or 바코드를 인식하지 못했습니다.\n다시 시도해주세요."
        case let .stop(isButtonTap):
            if isButtonTap {
                title = "알림"
                message = "바코드 읽기를 멈추었습니다."
                self.readButton.isSelected = readerView.isRunning
            } else {
                self.readButton.isSelected = readerView.isRunning
                return
            }
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)

        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
