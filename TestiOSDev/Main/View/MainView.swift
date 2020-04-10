//
//  MainView.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let tableView: UITableView = {
           let tv = UITableView()
           tv.translatesAutoresizingMaskIntoConstraints = false
           tv.separatorStyle = .none
           tv.keyboardDismissMode = .onDrag
           return tv
       }()
    
    let searchView: UISearchBar = {
        let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.returnKeyType = .go
        return sb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(searchView)
        
        searchView.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        searchView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1).isActive = true
        
        tableView.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
