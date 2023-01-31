//
//  RecordViewController.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/26.
//

import UIKit

class RecordViewController: UIViewController {
    
    let grayFirstBackView: UIView = UIView()
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
        
    }
    
    func setConstraints() {
        
    }
    
    func setNavigationBar() {
        self.title = "기록하기"
    }
}

extension UIButton.Configuration {
    static func setWineButtonStyle(_ title: String, image: UIImage) -> UIButton.Configuration {
        var configuration = self.plain()
        var titleAttributed = AttributedString.init(title)
        titleAttributed.font = UIFont(name: "GowunBatang-Regular", size: 18)
        titleAttributed.foregroundColor = .darkGray
        configuration.title = title
        configuration.titleAlignment = .center
        configuration.image = image
//        configuration.baseForegroundColor = .darkGray
//        configuration.baseBackgroundColor = .myGreen
        configuration.imagePlacement = .top
        configuration.imagePadding = 8
        configuration.attributedTitle = titleAttributed
        return configuration
    }
}
