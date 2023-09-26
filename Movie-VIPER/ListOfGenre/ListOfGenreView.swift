//
//  ListOfGenreView.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import UIKit


protocol PassBackData: AnyObject {
    func updateLabel(genreLabel: String)
}

class ListOfGenreView: UIViewController {

    @IBOutlet weak var listGenreTableView: UITableView!
    
    var presenter: ListOfGenreViewToPresenter?
    weak var pressDataDelegate: ListOfGenreView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        registerTable()
        // Do any additional setup after loading the view.
    }
    
    func registerTable() {
        listGenreTableView.delegate = self
        listGenreTableView.dataSource = self
        listGenreTableView.register(UINib(nibName: String(describing: GenreItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GenreItemTableViewCell.self))
    }
    
    func updateTable() {
        DispatchQueue.main.async {
            self.listGenreTableView.reloadData()
        }
    }

}

extension ListOfGenreView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.listOfGenre.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GenreItemTableViewCell.self), for: indexPath) as! GenreItemTableViewCell
        
        cell.genreItem.text = presenter?.listOfGenre[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let genresName = presenter?.listOfGenre[indexPath.row].name {
            presenter?.didSelectGenreAt(genreLabel: genresName)
        }
        
    }
}

extension ListOfGenreView: ListOfGenrePresenterToView{
    
}
