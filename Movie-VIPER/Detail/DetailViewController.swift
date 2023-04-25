//
//  DetailViewController.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 18/04/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var movieTableReview: UITableView!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieAdultBool: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieVoteCount: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieRating: UILabel!
    
    var presenter: DetailViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        setElement()
        // Do any additional setup after loading the view.
    }
    
    func registerTable(){
        movieTableReview.dataSource = self
        movieTableReview.delegate = self
        movieTableReview.register(UINib(nibName: String(describing: ReviewTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ReviewTableViewCell.self))
    }
    
    func setElement(){
        if let movie = presenter?.movie {
            movieOverview.text = movie.overview
            movie.adult == true ? (movieAdultBool.text = "True") : (movieAdultBool.text = "False")
            movieDate.text = convertStringToDate(inputDate: movie.releaseDate)
            movieName.text = movie.title
            movieRating.text = "\(movie.voteAverage)/10"
            movieLanguage.text = movie.originalLanguage
            movieVoteCount.text = String(movie.voteCount)
            let url = (URL(string: "\(Constant.baseImgURL)\(movie.posterPath)"))
            imageView.kf.setImage(with: url)
        }
        
        registerTable()
    }

}

extension DetailViewController: DetailPresenterToView{
    func updateTable() {
        DispatchQueue.main.async {
            self.movieTableReview.reloadData()
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReviewTableViewCell.self), for: indexPath) as! ReviewTableViewCell
        if let review = presenter?.reviews{
            cell.onBind(review: review[indexPath.row])
        }
        
        return cell
    }
    
    
}
