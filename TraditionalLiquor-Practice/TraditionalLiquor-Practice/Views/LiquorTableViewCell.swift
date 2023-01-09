//
//  LiguorTableViewCell.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/03.
//

import UIKit

class LiquorTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: LiquorTableViewCell.self)
    
    let networkManager = NetworkManager.shared
    
    // 이름, 도수, 용량, 주재료, 제조사
    let liquorImage: UIImageView = UIImageView()
    let title: UILabel = UILabel()
    let alcohol: UILabel = UILabel()
    let volume: UILabel = UILabel()
    let mainIngredient: UILabel = UILabel()
    let manufacturer: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        
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
        [title, alcohol, volume, mainIngredient, manufacturer, liquorImage].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            liquorImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            liquorImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            liquorImage.widthAnchor.constraint(equalToConstant: 150),
            liquorImage.heightAnchor.constraint(equalToConstant: 150),
            
            title.topAnchor.constraint(equalTo: liquorImage.topAnchor),
            title.leadingAnchor.constraint(equalTo: liquorImage.trailingAnchor, constant: 20),
            
            alcohol.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            alcohol.leadingAnchor.constraint(equalTo: liquorImage.trailingAnchor, constant: 20),
            
            volume.topAnchor.constraint(equalTo: alcohol.bottomAnchor, constant: 10),
            volume.leadingAnchor.constraint(equalTo: liquorImage.trailingAnchor, constant: 20),
            
            manufacturer.topAnchor.constraint(equalTo: volume.bottomAnchor, constant: 10),
            manufacturer.leadingAnchor.constraint(equalTo: liquorImage.trailingAnchor, constant: 20),
            
            mainIngredient.topAnchor.constraint(equalTo: liquorImage.bottomAnchor, constant: 20),
            mainIngredient.leadingAnchor.constraint(equalTo: liquorImage.leadingAnchor),
            mainIngredient.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            
        ])
    }
    
    func configure(with data: TraditionalLiquor) {
        title.text = data.liquorName
        alcohol.text = String(data.percentageOfAlcohol)
        volume.text = data.volume
        mainIngredient.text = data.mainIngredient
        manufacturer.text = data.manufacturer
        liquorImage.backgroundColor = .blue
        

    }
    
    func setImage() {
        
    }
 

}
