//
//  ViewController.swift
//  UIkitCombine-example1
//
//  Created by 순진이 on 2023/02/06.
//

import UIKit

class ViewController: UIViewController {
    let label: UILabel = UILabel()
    let button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }


}

extension ViewController {
    func setUI() {
        setAttributes()
        setConstraints()
    }
    
    func setAttributes() {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .blue
        button.configuration = config
        button.setTitle("Refresh", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }
    
    func setConstraints() {
        [label, button].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
