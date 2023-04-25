//
//  GenreViewController.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 18/04/23.
//

import UIKit

class GenreViewController: UIViewController {

    @IBOutlet weak var movieListByGenre: UICollectionView!
    
    var presenter: GenreViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        
        registerCollection()
        
        navigationItem.title = "Movie List By Genre"
        // Do any additional setup after loading the view.
    }
    
    func registerCollection(){
        movieListByGenre.delegate = self
        movieListByGenre.dataSource = self
        movieListByGenre.register(UINib(nibName: String(describing: MovieItemCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieItemCollectionViewCell.self))
    }
}

extension GenreViewController: GenrePresenterToView{
    
    func updateCollection() {
        DispatchQueue.main.async {
            self.movieListByGenre.reloadData()
        }
    }
}

extension GenreViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.listOfMovie?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieItemCollectionViewCell.self), for: indexPath) as! MovieItemCollectionViewCell
        
        if let movies = presenter?.listOfMovie{
            cell.binding(movieData: movies[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = DetailViewController(nibName: "DetailViewController", bundle: nil)
        if let movie = presenter?.listOfMovie {
            presenter?.didSelectMovieAt(movie: movie[indexPath.row])
        }
    }
}

extension GenreViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.screenWidth/2.2, height: Constant.screenWidth/1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
