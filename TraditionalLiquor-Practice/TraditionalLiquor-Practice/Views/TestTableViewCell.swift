//
//  TestTableViewCell.swift
//  TraditionalLiquor-Practice
//
//  Created by 순진이 on 2023/01/18.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: TestViewController.self)
    var contentImage: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        contentImage.contentMode = .scaleAspectFit
        contentImage.image = UIImage(systemName: "pencil")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        contentView.addSubview(contentImage)
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
