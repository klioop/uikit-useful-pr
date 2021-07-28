//
//  ViewController.swift
//  TimerPratice
//
//  Created by klioop on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var isCounting: Bool = false
    var count: Int = 0 {
        didSet {
            let timeFromCount = convertToTime(from: count)
            let text = hourString(hours: timeFromCount.0, minutes: timeFromCount.1, seconds: timeFromCount.2)
            
            textLabel.text = text
        }
    }
    
    let textLabel: UILabel = {
        let label = UILabel()
        
        var attributedText = NSMutableAttributedString(string: "00:00:00",
                                                       attributes: [
                                                        .font: UIFont.boldSystemFont(ofSize: 40),
                                                       ])
        label.attributedText = attributedText
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - buttons
    
    let startStopButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedText = NSMutableAttributedString(string: "START",
                                                       attributes: [
                                                        .font: UIFont.boldSystemFont(ofSize: 30),
                                                        .foregroundColor: UIColor.green
                                                       ])
        
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(startStopButtonTouched), for: .touchUpInside)
        
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let attributedText = NSMutableAttributedString(string: "RESET",
                                                       attributes: [
                                                        .font: UIFont.boldSystemFont(ofSize: 30),
                                                       ])
        
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self,
                         action: #selector(resetButtonTouched),
                         for: UIControl.Event.touchUpInside)
        
        return button
    }()
    
    func createStackViewForButtons() {
        
        let stackView = UIStackView(arrangedSubviews: [startStopButton, resetButton])
        startStopButton.widthAnchor.constraint(equalTo: resetButton.widthAnchor).isActive = true
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 100
        
        stackView.anchor(top: textLabel.bottomAnchor,
                         leading: view.safeAreaLayoutGuide.leadingAnchor,
                         trailing: view.safeAreaLayoutGuide.trailingAnchor,
                         bottom: nil,
                         padding: .init(top: 20,
                                        left: 30,
                                        bottom: 0,
                                        right: 30))
        //        stackView.anchorCenterX(to: view)
        
    }
    
    func convertToTime(from seconds: Int) -> (Int, Int, Int) {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        
        return (hours, minutes, seconds)
    }
    
    func hourString(hours: Int, minutes: Int, seconds: Int) -> String {
        let hourFormat = String(format: "%02d", hours)
        let minuteFormat = String(format: "%02d", minutes)
        let secondFormat = String(format: "%02d", seconds)
        
        return "\(hourFormat):\(minuteFormat):\(secondFormat)"
    }
    
    // MARK: - Selectors
    
    @objc func startStopButtonTouched(_ sender: UIButton) {
        if isCounting {
            isCounting = false
            let attributedText = NSMutableAttributedString(string: "START",
                                                           attributes: [
                                                            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
                                                            .foregroundColor: UIColor.green
                                                           ])
            startStopButton.setAttributedTitle(attributedText, for: .normal)
            timer.invalidate()
            
        } else {
            isCounting = true
            let attributedText = NSMutableAttributedString(string: "STOP",
                                                           attributes: [
                                                            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
                                                            .foregroundColor: UIColor.systemRed
                                                           ])
            startStopButton.setAttributedTitle(attributedText, for: .normal)
            
            let timerInterval: TimeInterval = 1
            timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: { [unowned self] _ in
                self.count += 1
            })
        }
    }
    
    @objc func resetButtonTouched(_ sender: UIButton) {
        let title = "Reset Timer?"
        let message = "Are you sure to reset timer?"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "YES",
                                      style: .default,
                                      handler: { [unowned self]_ in
                                        self.count = 0
                                        timer.invalidate()
                                      }))
        alert.addAction(UIAlertAction(title: "CANCEL",
                                      style: .cancel,
                                      handler: { _ in
                                        // do nothing
                                      }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [textLabel].forEach { view.addSubview($0) }
        createStackViewForButtons()
        
        textLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         leading: nil,
                         trailing: nil,
                         bottom: nil,
                         padding: .init(top: 20,
                                        left: 0,
                                        bottom: 0,
                                        right: 0))
        textLabel.anchorCenterX(to: view)
        
        
        
        //        resetButton.anchor(top: textLabel.bottomAnchor,
        //                           leading: nil,
        //                           trailing: view.safeAreaLayoutGuide.trailingAnchor,
        //                           bottom: nil,
        //                           padding: .init(top: 20,
        //                                          left: 0,
        //                                          bottom: 0,
        //                                          right: 20))
        //
        
        //        let startButtonRightPadding: CGFloat = (view.frame.size.width - 20 - resetButton.frame.size.width) / 2 - 20
        //        print(startButtonRightPadding)
        //        startStopButton.anchor(top: resetButton.topAnchor,
        //                               leading: nil,
        //                               trailing: resetButton.leadingAnchor,
        //                               bottom: nil,
        //                               padding: .init(top: 0,
        //                                              left: 0,
        //                                              bottom: 0,
        //                                              right: startButtonRightPadding))
        //
    }
    
    
}

