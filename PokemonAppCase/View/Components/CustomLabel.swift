//
//  CustomLabel.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    convenience init(backgroundColor: UIColor?, textColor: UIColor?, size: CGFloat?, textAlignment: NSTextAlignment?) {
        self.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        font = .systemFont(ofSize: size!, weight: .bold)
        self.textAlignment = textAlignment!
    }
}
