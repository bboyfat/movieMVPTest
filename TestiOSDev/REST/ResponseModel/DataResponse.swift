//
//  DataResponse.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

struct DataResponse: Decodable {
    
    var response: Bool?
    var search: [Movies]?
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case search = "Search"
    }
    
    init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
          self.response = try? container.decode(Bool.self, forKey: .response)
          self.search = try? container.decode([Movies].self, forKey: .search)
     }

}
