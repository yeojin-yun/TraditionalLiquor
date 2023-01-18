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
    
    var imageURL: String? {
        didSet {
            loadImage()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setAttributes()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension LiquorTableViewCell {
    private func setUI() {
        [title, alcohol, volume, mainIngredient, manufacturer, liquorImage].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
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
    
    private func setAttributes() {
        liquorImage.image = UIImage(systemName: "drop")
        liquorImage.contentMode = .scaleAspectFit
    }
    
    func configure(with data: TraditionalLiquor) {
        title.text = data.liquorName
        alcohol.text = String(data.percentageOfAlcohol)
        volume.text = data.volume
        mainIngredient.text = data.mainIngredient
        manufacturer.text = data.manufacturer
    }
    
    func loadImage() {
        guard let urlString = imageURL?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString)  else { return }
        // 오래걸리는 작업을 동시성 처리 (다른 쓰레드에서 일시킴)
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 (오래걸리는데 동기적인 실행)
            // (일반적으로 이미지를 가져올때 많이 사용)
            guard let data = try? Data(contentsOf: url) else { return }
            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거 ⭐️⭐️⭐️
            guard urlString == url.absoluteString else { return }
            
            // 작업의 결과물을 이미로 표시 (메인큐)
            DispatchQueue.main.async {
                self.liquorImage.image = UIImage(data: data)
            }
        }
    }
 

}
