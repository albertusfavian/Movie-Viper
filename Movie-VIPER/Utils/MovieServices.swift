//
//  MovieWorker.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation
import Moya

enum MovieServices{
    case getGenre
    case getMoviesByGenre(genreId: String)
    case getAllDiscover
    case getReviews(movieId: String)
    case getVideo(movieId: String)
    
}

extension MovieServices: TargetType{
    var sampleData: Data{
        return Data()
    }
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self{
        case .getAllDiscover, .getMoviesByGenre:
            return "discover/movie"
        case .getGenre:
            return "genre/movie/list"
        case .getVideo(let movieId):
            return "movie/\(movieId)/videos"
        case .getReviews(let movieId):
            return "movie/\(movieId)/reviews"
        }
    }
    
    var method: Moya.Method {
        switch self{
        default:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .getMoviesByGenre(let genreId):
            return .requestParameters(parameters: [
                "api_key": Constant.apiKey,
                "with_genres" : genreId,
            ], encoding: URLEncoding.queryString)
        default:
            return .requestParameters(parameters: ["api_key" : Constant.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var progressBlock: ProgressBlock? {
      switch self {
      default:
        return nil
      }
    }
    
    var headers: [String : String]? {
        switch self{
        default:
            return getHeaders()
        }
    }
}

extension MovieServices {
  private func getHeaders() -> [String: String] {
    let header = ["Accept": "application/json"]
    return header
  }
}

