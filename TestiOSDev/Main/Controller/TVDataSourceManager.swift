//
//  TVDataSourceManager.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol TVDataSource {
    
    func refresh(_ movies: [Movies]?)
    
}

class TableViewDataSourceManager: NSObject, TVDataSource {
    
    private var tableView: UITableView
    private var movies: [Movies] = []
    
    func refresh(_ movies: [Movies]?) {
        self.movies = movies ?? []
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setDatasource() {
        tableView.dataSource = self
    }
    
    private func registerCell() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setDatasource()
        registerCell()
        
    }
    
}

extension TableViewDataSourceManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
        let movie = movies[indexPath.row]
        cell.moviewTitle.text = movie.title
        cell.moviewYear.text = movie.year
        cell.posterImageView.load(movie.poster ?? "")
        return cell
    }
    
}
