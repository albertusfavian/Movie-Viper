//
//  ViewController.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var genreTable: UITableView!
    @IBOutlet weak var movieCollection: UICollectionView!
    
    var presenter: HomeViewToPresenter?
    let widthMovieItem = (Constant.screenWidth - 50) / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
        navigationItem.title = "MovieApp-Viper"
        
        registerTable()
        registerCollection()
        
        
        // Do any additional setup after loading the view.
    }
}


extension HomeViewController: HomePresenterToView{
    
    func registerTable(){
        genreTable.delegate = self
        genreTable.dataSource = self
        genreTable.register(UINib(nibName: String(describing: GenreItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GenreItemTableViewCell.self))
    }
    
    func updateTable() {
        DispatchQueue.main.async {
            self.genreTable.reloadData()
        }
    }
    
    func updateCollection() {
        DispatchQueue.main.async {
            self.movieCollection.reloadData()
        }
    }
    
    func registerCollection(){
        movieCollection.delegate = self
        movieCollection.dataSource = self
        movieCollection.register(UINib(nibName: String(describing: MovieItemCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieItemCollectionViewCell.self))
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.listOfGenre.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GenreItemTableViewCell.self), for: indexPath) as! GenreItemTableViewCell
        
        
        
        cell.genreItem.text = presenter?.listOfGenre[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = GenreViewController(nibName: "GenreViewController", bundle: nil)
        presenter?.didSelectGenreAt(genreId: presenter?.listOfGenre[indexPath.row].id)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.listOfMovies.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieItemCollectionViewCell.self), for: indexPath) as! MovieItemCollectionViewCell
        
        if let movies = presenter?.listOfMovies {
            cell.binding(movieData: movies[indexPath.row])
        }
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = widthMovieItem * 1.5
        return CGSize(width: widthMovieItem, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = DetailViewController(nibName: "DetailViewController", bundle: nil)
        if let movie = presenter?.listOfMovies {
            presenter?.didSelectedMovieAt(movie: movie[indexPath.row])
        }
    }
}
