//
//  CustomImage.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit

class CustomImage: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(cornerRadius: CGFloat) {
        self.init(frame: .zero)
        layer.cornerRadius = cornerRadius
    }
    
    private func configure() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
        layer.masksToBounds = true
    }
}
