//
//  ViewController.swift
//  Youtube
//
//  Created by 倉田　隆成 on 2018/06/04.
//  Copyright © 2018年 倉田　隆成. All rights reserved.
//
import Foundation
import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

//    var videos: [Video] = {
        
//        var kanyChannel = Channel()
//        kanyChannel.name = "浜辺美波"
//        kanyChannel.profileImageName = "hamanami.jpg"
        
//        var blackSpaceVideo = Video()
//        blackSpaceVideo.title = "Kimura Yu - Black Stone"
//        blackSpaceVideo.thumbnailImageName = "yu-kimura.jpg"
//        blackSpaceVideo.numberOfViews = 19981214
        
//        var badBloodVideo = Video()
//        badBloodVideo.title = "Kimura Yu - Bad Blood featureing Kendrick"
//        badBloodVideo.thumbnailImageName = "train"
//        badBloodVideo.numberOfViews = 199981222
//        return [blackSpaceVideo, badBloodVideo]
//    }()
    
    var videos: [Video]?
    
    func fetchVideos() {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            do{
                let json =  try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    print(dictionary["title"])
                }
                print(json)
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
        }.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        
        navigationItem.titleView = titleLabel
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
        setupNavBarButtons()
    }
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "help")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [searchBarButtonItem, moreButton]
    }
    
    @objc func handleSearch() {
        print(123)
    }
    
    @objc func handleMore() {
        
    }
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let hight = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: hight + 16 + 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}





