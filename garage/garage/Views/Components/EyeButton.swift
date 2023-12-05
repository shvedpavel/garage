//
//  EyeButton.swift
//  garage
//
//  Created by Apple on 4.12.23.
//

import UIKit

final class EyeButton: UIButton {
   
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }
    ///делаем не активным
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private funcs
    private func setupEyeButton() {
        setImage(UIImage(systemName: "eye.slash"), for: .normal)
        tintColor = .gray
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        isEnabled = false
    }
}
