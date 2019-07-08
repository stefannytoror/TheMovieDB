//
//  PageControlCollectionViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 6/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PageControlCollectionViewCell"

class PageControlCollectionViewController: UICollectionViewController {
    //let array = ["vista 1", "vista 2", "vista 3"]
    var recomendedMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBottomControls()
        //setSkipButton()
        requestMovies()
        //collectionView.backgroundColor = .gray
        collectionView.isPagingEnabled = true
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        //register(PageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
    }
    
    func requestMovies () {
        RequestFacade.trending(movieHandler: { (ListMovie) in
            self.recomendedMovies = Array(ListMovie.results.suffix(3))
            self.collectionView.reloadData()
        }) { (ErrorEnum) in
                print(ErrorEnum)
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return recomendedMovies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PageControlCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        
        // Configure the cell
        let recomendedMovie = recomendedMovies[indexPath.item]
        let image = recomendedMovie.backdrop_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image  ?? "")")
        let defaultUrl = URL(string: "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg")!
        
        cell.imageRecomendedMovie.af_setImage(withURL: url ?? defaultUrl)
        cell.descriptionMovie.text = recomendedMovie.titleMovie
        //cell.backgroundColor = .white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    private var previousButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("SKIP", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(skip), for: .touchUpInside)
        return button
    }
    
    @objc func skip() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func nextPage() {
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = pageControl.currentPage + 1
        
    }

    private var nextButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }
    
    private var skipButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("SKIP", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }

    private var pageControl: UIPageControl {
        let pageC = UIPageControl()
        pageC.currentPage = 0
        pageC.numberOfPages = 3
        pageC.currentPageIndicatorTintColor = UIColor.purple
        pageC.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 244/255, alpha: 1)
        return pageC
    }
    
    func setSkipButton() {
        view.addSubview(skipButton)
        NSLayoutConstraint.activate([
            skipButton.rightAnchor.constraint(equalTo: view.trailingAnchor),
            //button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            skipButton.heightAnchor.constraint(equalToConstant: 50)
            
            
            ])
        
    }

    fileprivate func setUpBottomControls() {
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)

        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)


            ])
    }
    
}

extension PageControlCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
