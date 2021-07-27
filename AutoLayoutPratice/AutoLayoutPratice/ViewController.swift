//
//  ViewController.swift
//  AutoLayoutPratice
//
//  Created by klioop on 2021/07/26.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 18),
        ]
        var attributedText = NSMutableAttributedString(string: "Join us today in fun games!", attributes: attributes)
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? We hope to see you in our store soon.", attributes: [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor.gray
        ]))
        
        textView.attributedText = attributedText
        textView.textAlignment = NSTextAlignment.center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let topImageView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
   
    
//    view.safeAreaLayoutGuide.topAnchor
    func setUpConstraints() {
        
        topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topImageView.topAnchor, constant: 100).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        topImageView.addSubview(imageView)
        view.addSubview(topImageView)
//        view.addSubview(imageView)
        view.addSubview(descriptionTextView)
      
        setUpConstraints()
    }


}

