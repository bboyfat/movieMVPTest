//
//  Presenter.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol Presenter {
    func setDelegate(_ delegate: MovieControllerDelegate)
    func getMovies(_ withTitle: String)
    func didSelectMoview(_ index: Int)
}


class MoviesPresenter: Presenter {

    
    weak var delegate: MovieControllerDelegate?
    private var dataStorage: MoviesDataManager!
    var movies: [Movies] = []
    
    func getMovies(_ withTitle: String) {
        Path.searchText = withTitle
        dataStorage.fetchMovies() {[weak self] (data, error) in
            switch error{
            case nil:
                self?.decodeData(data)
            default:
                self?.delegate?.showError(error?.localizedDescription)
            }
        }
    }

    func setDelegate(_ delegate: MovieControllerDelegate) {
        self.delegate = delegate
      }
    
    
    private func decodeData(_ data: Data?){
        guard let data = data else {return}
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedResponse = try decoder.decode(DataResponse.self, from: data)
            guard let movies = decodedResponse.search  else {return}
            self.movies = movies
            self.delegate?.updateMovies(movies)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func didSelectMoview(_ index: Int) {
        let movie = movies[index]
        delegate?.presentMovie(movie)
    }
    
    init() {
        dataStorage = MovieDataWorker()
    }
}
