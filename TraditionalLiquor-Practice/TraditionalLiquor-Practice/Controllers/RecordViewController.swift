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
    
}
