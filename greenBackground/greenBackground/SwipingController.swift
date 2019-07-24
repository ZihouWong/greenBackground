//
//  SwipingController.swift
//  greenBackground
//
//  Created by Zihou Wong on 7/24/19.
//  Copyright © 2019 Zihou Wong. All rights reserved.
//

import UIKit

extension UIColor {
    static var colorfoo = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    static var colorbrr = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
}
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        
        super.viewDidLoad()
//        collectionView.backgroundColor = .green
        setupButtomStackLayout()
        
    }
    
    let pages = [
        
        Page(imageName: "bear_fisrt", headerText: "i am the hearderText one", appendText: "i am the appendText one"),
        Page(imageName: "heart_second", headerText: "i am the hearderText two", appendText: "i am the appendText two"),
        Page(imageName: "leaf_third", headerText: "i am the hearderText third", appendText: "i am the appendText third"),
        Page(imageName: "bear_fisrt", headerText: "i am the hearderText one", appendText: "i am the appendText one"),
        Page(imageName: "heart_second", headerText: "i am the hearderText two", appendText: "i am the appendText two"),
        Page(imageName: "leaf_third", headerText: "i am the hearderText third", appendText: "i am the appendText third")
        ]
    
    let prewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Prew", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(handlePrew), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePrew() {
        let nextIndex = min(pageControl.currentPage, 0)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext() {
        
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = UIColor.gray
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        print(pages.count)
        pageControl.currentPageIndicatorTintColor = .colorfoo
        pageControl.pageIndicatorTintColor = .colorbrr
        
        return pageControl
    }()
    
    func setupButtomStackLayout() {
        
        let bottomControllerStackView = UIStackView(arrangedSubviews: [prewButton, pageControl, nextButton])
        
        collectionView.addSubview(bottomControllerStackView)
        bottomControllerStackView.backgroundColor = .red
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
