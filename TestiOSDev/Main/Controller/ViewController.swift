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

    var model: [Movies] = []
    var moviesPresenter: Presenter!
    var dataSourceManager: TVDataSource!
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        commonInit()
        moviesPresenter.loadData()
    }
    
    private func commonInit() {
        moviesPresenter = MoviesPresenter()
        moviesPresenter.setDelegate(self)
        dataSourceManager = TableViewDataSourceManager(tableView)
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
       
    func setTableView() {
        self.view.backgroundColor = .white
        self.tableView.frame = self.view.bounds
        tableView.delegate = self
        self.view.addSubview(tableView)
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
