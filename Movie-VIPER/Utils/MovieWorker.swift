//
//  MovieWorker.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation
import Moya

public protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

protocol MovieWorkerProtocol{
    var genreDelegate: MovieGenreProtocol? {get set}
    var movieListDiscover: MovieListDiscover? {get set}
    var movieDelegate: MovieDetailProtocol? {get set}
    func getGenre()
    func getMovieListDiscover()
    func getMovieByGenre(genreId: String)
    func getReviews(movieId: String)
    func getVideo(movieId: String)
}

protocol MovieGenreProtocol: AnyObject {
    func didSuccessGetGenres(response: [Genre])
    func didFailedGetGenres(error: String)
}

protocol MovieDetailProtocol: AnyObject{
    func didSuccessGetReview(response: Reviews)
    func didFailedGetReview(error: String)
    func didSuccessGetVideo(response: Videos)
    func didFailedGetVideo(error: String)
}

protocol MovieListDiscover: AnyObject{
    func didSuccessGetMovieListDiscover(response: [Movie])
    func didFailedGetMovieListDiscover(error: String)
}




public class MovieWorker: MovieWorkerProtocol{
    let provider = MoyaProvider<MovieServices>()
    
    var genreDelegate: MovieGenreProtocol?
    var movieListDiscover: MovieListDiscover?
    var movieDelegate: MovieDetailProtocol?
    
    func getReviews(movieId: String) {
        provider.request(.getReviews(movieId: movieId)) { result in
            switch result {
            case .success(let result):
                do {
                    let reviews = try JSONDecoder().decode(Reviews.self, from: result.data)
                    self.movieDelegate?.didSuccessGetReview(response: reviews)
                } catch {
                    self.movieDelegate?.didFailedGetReview(error: error.localizedDescription)
                }
            case .failure(let error):
                self.movieDelegate?.didFailedGetReview(error: error.localizedDescription)
            }
        }
    }
    
    public func getGenre(){
        provider.request(.getGenre) { result in
            switch result {
            case .success(let result):
                do {
                    let genres = try JSONDecoder().decode(Genres.self, from: result.data)
                    self.genreDelegate?.didSuccessGetGenres(response: genres.genres ?? [] )
                } catch {
                    self.genreDelegate?.didFailedGetGenres(error: error.localizedDescription)
                }
            case .failure(let error):
                self.genreDelegate?.didFailedGetGenres(error: error.localizedDescription)
            }
            
        }
    }
    
    public func getMovieByGenre(genreId: String) {
        provider.request(.getMoviesByGenre(genreId: genreId)) { result in
            switch result{
            case .success(let result):
                do{
                    let movies = try JSONDecoder().decode(Movies.self, from: result.data)
                    self.movieListDiscover?.didSuccessGetMovieListDiscover(response: movies.results ?? [])
                } catch let error {
                    self.movieListDiscover?.didFailedGetMovieListDiscover(error: error.localizedDescription)
                }
            case .failure(let error):
                self.movieListDiscover?.didFailedGetMovieListDiscover(error: error.localizedDescription)
            }
        }
    }
    
    public func getVideo(movieId: String) {
        provider.request(.getVideo(movieId: movieId)) { result in
            switch result {
            case .success(let result):
                do {
                    let videos = try JSONDecoder().decode(Videos.self, from: result.data)
                    self.movieDelegate?.didSuccessGetVideo(response: videos)
                } catch let error {
                    self.movieDelegate?.didFailedGetVideo(error: error.localizedDescription)
                }
            case .failure(let error):
                self.movieDelegate?.didFailedGetVideo(error: error.localizedDescription)
            }
        }
    }
    
    public func getMovieListDiscover() {
        provider.request(.getAllDiscover) { result in
            switch result {
            case .success(let result):
                do {
                    let movies = try JSONDecoder().decode(Movies.self, from: result.data)
                    self.movieListDiscover?.didSuccessGetMovieListDiscover(response: movies.results ?? [])
                } catch {
                    self.movieListDiscover?.didFailedGetMovieListDiscover(error: error.localizedDescription)
                }
            case .failure(let error):
                self.movieListDiscover?.didFailedGetMovieListDiscover(error: error.localizedDescription)
            }
        }
    }
}

