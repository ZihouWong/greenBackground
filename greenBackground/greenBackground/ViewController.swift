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
        // Do any additional setup after loading the view.
        let imageView = UIImageView(image: UIImage.init(named: "bear_first"))
        view.addSubview(imageView)
        
    }


}

