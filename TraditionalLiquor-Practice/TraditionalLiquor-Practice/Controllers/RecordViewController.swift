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
    func setUI() {
        setAttributes()
        setConstraints()
    }
    
    func setAttributes() {
        searchButton.configuration = .setWineButtonStyle("전통주를 검색해주세요.")
        searchButton.backgroundColor = .lightGray
        
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
        var configuration = self.plain()
        var titleAttributed = AttributedString.init(title)
        titleAttributed.font = UIFont(name: "Pretendard-Regular", size: 18)
        titleAttributed.foregroundColor = .darkGray
        configuration.title = title
        configuration.titleAlignment = .trailing
        configuration.title
        configuration.baseForegroundColor = .darkGray
        configuration.baseBackgroundColor = .lightGray
        configuration.attributedTitle = titleAttributed
        return configuration
    }
}
