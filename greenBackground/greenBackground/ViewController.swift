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
//        view.backgroundColor = .green

        setupLayout()
    }
    
    let topimageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "here is a textView"
        textView.backgroundColor = .red
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()
    
    let topImageContainerView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private func setupLayout() {
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(topimageView)
        
        view.addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            ])

        NSLayoutConstraint.activate([
            topimageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            topimageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            topimageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            ])
        
        NSLayoutConstraint.activate([
                descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
                descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    

}

