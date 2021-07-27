//
//  TwoTextLineButton.swift
//  ProgramaticUIbutton
//
//  Created by klioop on 2021/07/27.
//

import UIKit

struct TwoLineButtonViewModel {
    let primaryLabel: String
    let secondaryLabel: String
}

final class TwoLineButton: UIButton {
    
    private let primaryLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private let secondaryLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [primaryLabel, secondaryLabel].forEach{ addSubview($0) }
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        backgroundColor = .systemGreen
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TwoLineButtonViewModel) {
        primaryLabel.text = viewModel.primaryLabel
        secondaryLabel.text = viewModel.secondaryLabel
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height / 2)
        secondaryLabel.frame = CGRect(x: 0, y: frame.size.height / 2, width: frame.size.width, height: frame.size.height / 2)
        
    }
    
}
