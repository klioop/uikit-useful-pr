//
//  TwoTextLineButton.swift
//  ProgramaticUIbutton
//
//  Created by klioop on 2021/07/27.
//

import UIKit

struct iconCustomButtonViewModel {
    let stringLabel: String
    let image: UIImage?
    let backgroundColor: UIColor?
}

final class iconCustomButton: UIButton {
    
    private let stringLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private let imageIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [stringLabel, imageIconView].forEach{ addSubview($0) }
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: iconCustomButtonViewModel) {
        stringLabel.text = viewModel.stringLabel
        imageIconView.image = viewModel.image
        backgroundColor = viewModel.backgroundColor
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // update the frame of the stringLabel to fit its textv
        stringLabel.sizeToFit()
        let iconSize: CGFloat = 30
        let iconRightPadding: CGFloat = 10
        // 5 is the space(or buffer) between the icon and text
        let iconX: CGFloat = (frame.size.width - stringLabel.frame.size.width - iconSize - iconRightPadding) / 2
        imageIconView.frame = CGRect(x: iconX,
                                  // vertically center position
                                 y: (frame.size.height - iconSize) / 2,
                                 width: iconSize,
                                 height: iconSize)
        stringLabel.frame = CGRect(x: iconX + iconSize + iconRightPadding,
                                   y: 0,
                                   width: stringLabel.frame.size.width,
                                   height: frame.size.height)
    }
    
}
