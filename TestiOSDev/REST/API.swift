//
//  API.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import Foundation

enum Path {
    
    static var searchText = "fast"
    static var baseURL: URL {
        return URL(string: "https://www.omdbapi.com/?s=\(Path.searchText)&apikey=\(Path.getApiKey())")!
    }
    
    static func getApiKey() -> String {
        let apiKey = ApiKey()
        return apiKey.movieApiKey
    }
}


struct ApiKey: Codable {
    
    var movieApiKey: String = ""
    
    private mutating func getApiKey() {
        if  let path = Bundle.main.path(forResource: "API", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let preferences = try? PropertyListDecoder().decode(ApiKey.self, from: xml) {
            self.movieApiKey = preferences.movieApiKey
        }
    }
    
    init() {
        
        getApiKey()
        
    }
}
