//
//  ViewController.swift
//  greenBackground
//
//  Created by Zihou Wong on 7/24/19.
//  Copyright © 2019 Zihou Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        setupLayout()
    }
    
    let topimageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        
        view.addSubview(topImageContainerView)
        view.addSubview(topimageView)
        
        topImageContainerView.backgroundColor = .purple
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            ])

        
        NSLayoutConstraint.activate([
            topimageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            topimageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            topimageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            ])

    }

}

