//
//  TableViewCell.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let posterImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
        return view
    }()
    
    let moviewTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "System", size: 16)
        lbl.text = "Fast"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let moviewYear: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "System", size: 10)
        lbl.text = "2006"
        lbl.alpha = 0.7
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImageView)
        contentView.addSubview(moviewYear)
        contentView.addSubview(moviewTitle)
        
        posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        posterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35).isActive = true
        posterImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        
        moviewTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        moviewTitle.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16).isActive = true
        moviewTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20).isActive = true
        
        moviewYear.topAnchor.constraint(equalTo: moviewTitle.bottomAnchor, constant: 16).isActive = true
        moviewYear.leadingAnchor.constraint(equalTo: moviewTitle.leadingAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


