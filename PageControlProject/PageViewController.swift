//
//  PageViewController.swift
//  PageControlProject
//
//  Created by Omer Keskin on 11.07.2024.
//

import Foundation
import UIKit

class PageViewController: UIViewController {
    var pageIndex: Int = 0
    var backgroundColor: UIColor = .white 
    var labelText: String = ""
    var imageName: String = ""
    var labelColor: UIColor = .clear

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor

        label.text = labelText
        imageView.image = UIImage(named: imageName)
        label.textColor = labelColor

        view.addSubview(label)
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
}
