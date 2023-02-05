//
//  RecordViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/26.
//

import UIKit

class RecordViewController: BaseViewController {
    
    let searchButton: UIButton = UIButton()
    let graySecondBackView: UIView = UIView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension RecordViewController {
    @objc func searchButtonTapped(_ sender: UIButton) {
        let vc = RecordSearchViewController()
        self.present(vc, animated: true)
    }
}

extension RecordViewController {
    func setUI() {
        setAttributes()
        setConstraints()
        setNavigationBar()
    }
    
    func setAttributes() {
//        searchButton.configuration = .setWineButtonStyle("전통주를 검색해주세요.")
        searchButton.setTitle("전통주를 검색해주세요.", for: .normal)
        searchButton.setTitleColor(UIColor(hexString: "141414"), for: .normal)
        searchButton.backgroundColor = UIColor(hexString: "F0F0F0", alpha: 1.0)
        searchButton.titleEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        searchButton.contentHorizontalAlignment = .leading
        searchButton.layer.cornerRadius = 4
        searchButton.addTarget(self, action: #selector(searchButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    func setConstraints() {
        [searchButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            searchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchButton.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
    
    func setNavigationBar() {
        self.title = "기록하기"
    }
}

extension UIButton.Configuration {
    static func setWineButtonStyle(_ title: String) -> UIButton.Configuration {
        var configuration = self.gray()
        var titleAttributed = AttributedString.init(title)
        titleAttributed.font = UIFont(name: "Pretendard-Regular", size: 18)
//        titleAttributed.foregroundColor = .darkGray
        configuration.title = title
        configuration.titleAlignment = .leading
//        configuration.baseForegroundColor = .darkGray
//        configuration.baseBackgroundColor = .lightGray
        configuration.attributedTitle = titleAttributed
        return configuration
    }
}
