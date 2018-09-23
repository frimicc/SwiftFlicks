//
//  MovieModel.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

struct MovieModel {
    var title: String
    var description: String
    var posterURL: URL?
    var backgroundURL: URL?
    var searchTitle: String
    
    init(_ dict: Dictionary<String, String>) {
        if let title = dict["original_title"] {
            self.title = title
            self.searchTitle = MovieModel.createSearchTitle(from: title)
        } else {
            self.title = "No title"
            self.searchTitle = "None"
        }
        
        if let description = dict["overview"] {
            self.description = description
        } else {
            self.description = "No description"
        }
        
        if let posterPath = dict["poster_path"] {
            let fullPosterUrl = "https://image.tmdb.org/t/p/w45" + posterPath
            posterURL = URL(string: fullPosterUrl)
            let fullBackgroundUrl = "https://image.tmdb.org/t/p/w342" + posterPath
            backgroundURL = URL(string: fullBackgroundUrl)
        }
    }
}

extension MovieModel {
    static func createSearchTitle(from title: String) -> String {
        var searchTitle = title
        searchTitle = searchTitle.replacingOccurrences(of: "The ", with: "")
        searchTitle = searchTitle.replacingOccurrences(of: "An ", with: "")
        searchTitle = searchTitle.replacingOccurrences(of: "A ", with: "")
        // etc. and so forth
        return searchTitle
    }
}
