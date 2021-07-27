//
//  ViewController.swift
//  TimerPratice
//
//  Created by klioop on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    let textLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "00:00:00",
                                                       attributes: [
                                                        .font: UIFont.boldSystemFont(ofSize: 30),
                                                       ])
        label.attributedText = attributedText
        label.textAlignment = .center
        
        return label
    }()
    
    let startStopButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedText = NSMutableAttributedString(string: "START",
                                                       attributes: [
                                                        .font: UIFont.boldSystemFont(ofSize: 20),
                                                        .foregroundColor: UIColor.green
                                                       ])
        
        button.setAttributedTitle(attributedText, for: .normal)
        
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let attributedText = NSMutableAttributedString(string: "RESET",
                                                       attributes: [
                                                        .font: UIFont.boldSystemFont(ofSize: 20),
                                                       ])
        
        button.setAttributedTitle(attributedText, for: .normal)
        
        button.addTarget(self, action: #selector(tempSelector), for: UIControl.Event.touchUpInside)
        
        return button
    }()
    
    @objc func tempSelector() {
        print("Hello, button!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [textLabel, startStopButton, resetButton].forEach { view.addSubview($0) }
        
        textLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.centerXAnchor, trailing: nil, bottom: nil, padding: .init(top: 20, left: -70, bottom: 0, right: 0))
        
        startStopButton.anchor(top: textLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 20, left: 80, bottom: 0, right: 0))
        resetButton.anchor(top: startStopButton.topAnchor, leading: startStopButton.trailingAnchor, trailing: nil, bottom: nil, padding: .init(top: 0, left: 100, bottom: 0, right: 0))
    }
    
    
}

