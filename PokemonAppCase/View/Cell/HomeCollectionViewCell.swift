//
//  HomeCollectionViewCell.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit
import Kingfisher
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    //MARK: - Properties
    private let pokemonsImage = CustomImage(cornerRadius: 8)
    private let pokemonsName = CustomLabel(backgroundColor: .clear, textColor: .label, size: 22, textAlignment: .center)
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonsName.text = nil
        pokemonsImage.image = nil
    }
}

//MARK: - View Configure
extension HomeCollectionViewCell {
    
    private func layout() {
        contentView.addSubviews(views: pokemonsImage, pokemonsName)
        
        pokemonsImage.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().offset(5)
            make.width.equalTo(150)
            make.height.equalTo(75)
        }
        
        pokemonsName.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(16)
            make.leading.equalTo(pokemonsImage.snp.trailing).offset(16)
            make.height.equalTo(50)
        }
    }
    
    func setPokemon(model: CombinedArray) {
        pokemonsName.text = model.name.capitalized
        pokemonsImage.kf.setImage(with: model.image?.asUrl)
    }
}
