//
//  MovieDataSource.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol MoviesDataManager {
    
    func fetchMovies(_ completion: @escaping(Data?, Error?) -> ())
    
}

class MovieDataWorker: MoviesDataManager {
    
    func fetchMovies(_ completion: @escaping (Data?, Error?) -> ()) {
        URLSession.shared.dataTask(with: Path.baseURL) { (data, response, error) in
            guard error == nil else {completion(nil, error); return}
            completion(data, nil)
        }.resume()
    }
    
}
