//
//  HomeViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/25.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let noDataFace: UIImageView = UIImageView(image: UIImage(named: "gloomyFace"))
    let noDataLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setUpNavigationBar()
        view.backgroundColor = .white
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.square"), style: .plain, target: self, action: #selector(plusButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
}

// MARK: -Button Action
extension HomeViewController {
    @objc func plusButtonTapped(_ sender: UIButton) {
        print(#function)
        let recordVC = RecordViewController()
        let nav = UINavigationController(rootViewController: recordVC)
        self.navigationController?.pushViewController(recordVC, animated: true)
    }
}

extension HomeViewController {
    func setUI() {
        setAttributes()
        setConstraints()
    }
    
    func setAttributes() {
        noDataLabel.text = "현재 주류 기록이 없어요"
        noDataLabel.font = UIFont(name: "Pretendard-Regular", size: 20)
    }
    
    func setConstraints() {
        [noDataFace, noDataLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            noDataFace.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noDataFace.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noDataFace.heightAnchor.constraint(equalToConstant: 40),
            noDataFace.widthAnchor.constraint(equalToConstant: 40),
            
            noDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noDataLabel.topAnchor.constraint(equalTo: noDataFace.bottomAnchor, constant: 24)
        ])
    }
    
    func setUpNavigationBar() {
        let titleView: UIView = UIView()
        titleView.backgroundColor = .blue
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "나의 주류 기록"
        titleLabel.font = UIFont(name: "Pretendard-Regular", size: 24)
        let plusButton: UIButton = UIButton()
        plusButton.setImage(UIImage(systemName: "plus.square"), for: .normal)
        plusButton.tintColor = .black
        plusButton.addTarget(self, action: #selector(plusButtonTapped(_:)), for: .touchUpInside)
        
        [titleLabel].forEach {
            titleView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -140),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor, constant: 5),
//            
//            plusButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 150),
//            plusButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
//            plusButton.heightAnchor.constraint(equalToConstant: 50),
//            plusButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        navigationItem.titleView = titleView
        
    }
}
