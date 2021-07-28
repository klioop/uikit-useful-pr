//
//  ViewController.swift
//  ProgramaticUIbutton
//
//  Created by klioop on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    let twoLineButton = TwoLineButton(frame: CGRect(x: 0, y: 0, width: 300, height: 55))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        twoLineButton.configure(with: TwoLineButtonViewModel(primaryLabel: "This is primary Label.",
                                                             secondaryLabel: "This is secondary label of this button."))
        
        let iconTextButton = iconCustomButton(frame: CGRect(x: (view.frame.size.width - 300) / 2,
                                                            y: 60,
                                                            width: 300,
                                                            height: 55))
        
        iconTextButton.configure(with: iconCustomButtonViewModel(stringLabel: "Buy this",
                                                                 image: UIImage(systemName: "cart"),
                                                                 backgroundColor: .systemRed))
        
        view.addSubview(twoLineButton)
        view.addSubview(iconTextButton)
        
        twoLineButton.center = view.center
        
        iconTextButton.translatesAutoresizingMaskIntoConstraints = false
        iconTextButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        iconTextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        iconTextButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        iconTextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }


}

