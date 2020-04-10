//
//  MoviesResponse.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation


struct Movies: Decodable {
    
    var poster: String?
    var title: String?
    var type: String?
    var year: String?
    var imdbID: String?
    
    enum CodingKeys: String, CodingKey {
        case poster = "Poster"
         case title = "Title"
         case type = "Type"
         case year = "Year"
         case imdbID = "imdbID"
     }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
         self.poster = try? container.decode(String.self, forKey: .poster)
         self.title = try? container.decode(String.self, forKey: .title)
         self.type = try? container.decode(String.self, forKey: .type)
         self.year = try? container.decode(String.self, forKey: .year)
         self.imdbID = try? container.decode(String.self, forKey: .imdbID)

    }
}
