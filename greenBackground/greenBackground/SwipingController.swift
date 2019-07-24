//
//  SwipingController.swift
//  greenBackground
//
//  Created by Zihou Wong on 7/24/19.
//  Copyright © 2019 Zihou Wong. All rights reserved.
//

import UIKit

extension UIColor {
    static var colorfoo = UIColor(red: 0.24, green: 0.32, blue: 0.9, alpha: 1)
    static var colorbrr = UIColor(red: 0.50, green: 0.55, blue: 0.55, alpha: 1)
}
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupButtomStackLayout()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    let pages = [
        
        Page(imageName: "bear_first", headerText: "i am the hearderText one", appendText: "i am the appendText one"),
        Page(imageName: "heart_second", headerText: "i am the hearderText two", appendText: "i am the appendText two"),
        Page(imageName: "leaf_third", headerText: "i am the hearderText third", appendText: "i am the appendText third"),
        Page(imageName: "bear_first", headerText: "i am the hearderText one", appendText: "i am the appendText one"),
        Page(imageName: "heart_second", headerText: "i am the hearderText two", appendText: "i am the appendText two"),
        Page(imageName: "leaf_third", headerText: "i am the hearderText third", appendText: "i am the appendText third")
        ]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    let prewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Prew", for: .normal)
        button.addTarget(self, action: #selector(handlePrew), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePrew() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.backgroundColor = UIColor.gray
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        print(pages.count)
        pageControl.currentPageIndicatorTintColor = .colorfoo
        pageControl.pageIndicatorTintColor = .colorbrr
        
        return pageControl
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
    }
    func setupButtomStackLayout() {
        
        let bottomControllerStackView = UIStackView(arrangedSubviews: [prewButton, pageControl, nextButton])
        
        collectionView.addSubview(bottomControllerStackView)
//        bottomControllerStackView.backgroundColor = .red
        bottomControllerStackView.distribution = .fillEqually
        bottomControllerStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomControllerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControllerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControllerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControllerStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
