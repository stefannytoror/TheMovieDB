//
//  CreditsCollectionViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/4/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DetailCreditsCollectionViewCell"
private let headerIdentifier = "HeaderCellId"

class CreditsCollectionViewController: UICollectionViewController {
    
    var movieDetail: Movie?
    var movieCast = [Cast]()
    
    
    let headerHeight: CGFloat = 200
    let itemHeight: CGFloat = 100
    let minimunLineSpacing = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        requestCredits()
        //Customization Layout
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = CGFloat(minimunLineSpacing)
        
        // header
        collectionView.register(DetailHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: Request
    func requestCredits() {
        let selectedListType : MoviesListType = .credits(id: movieDetail?.id ?? 0)
        RequestFacade.retrieveMovieList(type: selectedListType, object: MovieCredits.self, movieHandler: { (movieCredits) in
            self.movieCast = movieCredits.cast
            self.movieCast = Array(self.movieCast.prefix(10))
            self.collectionView.reloadData()
            
        }) { (RequestError) in
            print(RequestError)
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movieCast.count)
        return movieCast.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier , for: indexPath) as? DetailCreditsCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        let actor = movieCast[indexPath.row]
        let actorImage = actor.profile_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(actorImage ?? "")")
        cell.actorImage.af_setImage(withURL: url!)
        cell.actorName.text = actor.name
        cell.actorCharacter.text = actor.character
        cell.actorGender.text = (actor.gender == 1) ? Gender.Female.rawValue : Gender.Male.rawValue
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        configureHeader(header: header)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: headerHeight)
    }
    
    func configureHeader(header: UICollectionReusableView) {
        let image = movieDetail?.backdrop_path ?? ""
        let imageui = UIImageView()
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        imageui.af_setImage(withURL: url!)
        imageui.contentMode = .scaleToFill
        imageui.frame = header.bounds
        header.addSubview(imageui)
    }
}

extension CreditsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 365, height: itemHeight)
    }

}
