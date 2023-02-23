//
//  HomeVC.swift
//  SkeletonViewCustomTableView
//
//  Created by Emre Koçak on 21.02.2023.
//

import UIKit
import SkeletonView

class HomeVC: UIViewController {
    
    // MARK: - Property
    
    private var tableView = UITableView()
    private let cellId: String = "cellId"
    private var movieList = [MovieData]()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchMovies()
        
        view.isSkeletonable = true
        tableView.isSkeletonable = true
        
        self.view.showAnimatedGradientSkeleton()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.stopSkeletonAnimation()
            self.tableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
    
}

// MARK: - Funcs
extension HomeVC {
    func setupUI() {
        title = "Movies"
        
        tableView.rowHeight = 200
        tableView.estimatedRowHeight = 200
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
        view = tableView
    }
    
    func fetchMovies() {
        let movie1 = MovieData(movieImage: "avengers", movieName: "AVENGERS", movieYear: 2000)
        let movie2 = MovieData(movieImage: "images", movieName: "STAR-WARS", movieYear: 2002)
        let movie3 = MovieData(movieImage: "joker", movieName: "JOKER", movieYear: 2004)
        let movie4 = MovieData(movieImage: "movie", movieName: "AVATAR", movieYear: 2005)
        let movie5 = MovieData(movieImage: "spider", movieName: "SPIDER-MAN", movieYear: 2006)
        let movie6 = MovieData(movieImage: "violent", movieName: "VIOLENT", movieYear: 2007)
        
        movieList.append(movie1)
        movieList.append(movie2)
        movieList.append(movie3)
        movieList.append(movie4)
        movieList.append(movie5)
        movieList.append(movie6)
    }
}

// MARK: - Skeleton Delegate Impl
extension HomeVC: SkeletonTableViewDelegate, SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return cellId
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
        cell.imgView.image = UIImage(named: movieList[indexPath.row].movieImage)
        cell.nameLabel.text = "Name: \(movieList[indexPath.row].movieName)"
        cell.releaseDateLabel.text = "Year: \(movieList[indexPath.row].movieYear)"
        
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 200
    //    }
    
}
