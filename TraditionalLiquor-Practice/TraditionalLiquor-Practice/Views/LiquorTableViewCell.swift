//
//  LiguorTableViewCell.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/03.
//

import UIKit

class LiquorTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: LiquorTableViewCell.self)
    
    // 이름, 도수, 용량, 주재료, 제조사
    let title: UILabel = UILabel()
    let alcohol: UILabel = UILabel()
    let volume: UILabel = UILabel()
    let mainIngredient: UILabel = UILabel()
    let manufacturer: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        setTest()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension LiquorTableViewCell {
    private func setUI() {
        [title, alcohol, volume, mainIngredient, manufacturer].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            alcohol.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            alcohol.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            
            volume.topAnchor.constraint(equalTo: alcohol.bottomAnchor, constant: 20),
            volume.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            
            mainIngredient.topAnchor.constraint(equalTo: volume.bottomAnchor, constant: 20),
            mainIngredient.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            
            manufacturer.topAnchor.constraint(equalTo: mainIngredient.bottomAnchor, constant: 20),
            manufacturer.leadingAnchor.constraint(equalTo: title.leadingAnchor),
        ])
    }
    
    private func setTest() {
        title.text = "애피소드호프"
        alcohol.text = "3.5"
        volume.text = "500ml"
        mainIngredient.text = "사과과즙, 보리, 쌀, 홉"
        manufacturer.text = "㈜한국애플리즈"
    }
}
