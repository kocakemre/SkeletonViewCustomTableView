//
//  CustomCell.swift
//  SkeletonViewCustomTableView
//
//  Created by Emre Koçak on 21.02.2023.
//

import UIKit
import SkeletonView

class CustomCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .yellow
        img.isSkeletonable = true
        
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isSkeletonable = true
        
        return label
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isSkeletonable = true
        
        return label
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.isSkeletonable = true
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CustomCell {
    
    func setup() {
        //        addSubview(imgView)
        //        addSubview(nameLabel)
        //        addSubview(releaseDateLabel)
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(releaseDateLabel)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imgView.heightAnchor.constraint(equalToConstant: 190),
            imgView.widthAnchor.constraint(equalToConstant: 190),
            //            imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            //            imgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            nameLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            releaseDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            releaseDateLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
