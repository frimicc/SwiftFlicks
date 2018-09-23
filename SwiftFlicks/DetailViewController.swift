//
//  DetailViewController.swift
//  SwiftFlicks
//
//  Created by Michael on 9/23/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
            if let bgImageView = backgroundImageView {
                if let bgURL = detail.backgroundURL {
                    bgImageView.af_setImage(withURL: bgURL)
                } else {
                    bgImageView.image = Image(named: "NoPosterImage")
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    var detailItem: MovieModel? {
        didSet {
            configureView()
        }
    }


}

