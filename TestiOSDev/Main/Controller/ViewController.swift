//
//  ViewController.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol MovieControllerDelegate: class {
    func updateMovies(_ movies: [Movies]?)
    func showError(_ error: String?)
    func presentMovie(_ movie: Movies)
}

class ViewController: UIViewController, MovieControllerDelegate {
    
    var mainView: MainView!
    var moviesPresenter: Presenter!
    var dataSourceManager: TVDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        commonInit()
        moviesPresenter.getMovies("fast")
    }
    
    private func commonInit() {
        moviesPresenter = MoviesPresenter()
        moviesPresenter.setDelegate(self)
        dataSourceManager = TableViewDataSourceManager(mainView.tableView)
    }
    
    func updateMovies(_ movies: [Movies]?) {
        dataSourceManager.refresh(movies)
    }
    
    func showError(_ error: String?) {
        print(error ?? "")
    }
    
    func presentMovie(_ movie: Movies) {
        let controller = DetailsController()
        controller.movie = movie
        self.present(controller, animated: true, completion: nil)
    }
    
    func configView() {
        mainView = MainView(frame: self.view.frame)
        self.view.addSubview(mainView)
        setTableView()
    }
    
    func setTableView() {
        self.view.backgroundColor = .white
        self.mainView.tableView.frame = self.view.bounds
        mainView.tableView.delegate = self
        mainView.searchView.delegate = self
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * 0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        moviesPresenter.didSelectMoview(indexPath.row)
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        moviesPresenter.getMovies(searchBar.text ?? "")
        self.view.endEditing(true)
    }
    
}
