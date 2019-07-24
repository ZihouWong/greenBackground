//
//  PageCell.swift
//  greenBackground
//
//  Created by Zihou Wong on 7/24/19.
//  Copyright © 2019 Zihou Wong. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            topImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.appendText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    let topImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "this is a textView"
        textView.backgroundColor = .red
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
            ])
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        
        topImageContainerView.addSubview(topImageView)
        NSLayoutConstraint.activate([
            topImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            topImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            topImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
