//
//  HomeDetailView.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit
import Kingfisher
import SnapKit

final class HomeDetailView: UIViewController {
    
    //MARK: - Properties
    private let pokemonImage = CustomImage(cornerRadius: 10)
    private let pokemonsName = CustomLabel(backgroundColor: .clear, textColor: .black, size: 28, textAlignment: .center)
    private let pokemonAbilities = CustomLabel(backgroundColor: .clear, textColor: .secondaryLabel, size: 25, textAlignment: .center)
    
    var presenter: HomeDetailPresenterProtocol!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter.load()
        layout()
    }
}

//MARK: - HomeDetailView
extension HomeDetailView {
    
    private func layout() {
        view.addSubviews(views: pokemonImage, pokemonsName, pokemonAbilities)
        
        pokemonImage.contentMode = .scaleAspectFill
        pokemonImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.width.equalTo(175)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        pokemonsName.snp.makeConstraints { make in
            make.top.equalTo(pokemonImage.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
        
        pokemonAbilities.numberOfLines = 0
        pokemonAbilities.snp.makeConstraints { make in
            make.top.equalTo(pokemonsName.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(80)
        }
    }
}

//MARK: - HomeDetailView
extension HomeDetailView: HomeDetailViewProtocol {

    func updateView(with model: CombinedArray) {
        pokemonImage.kf.setImage(with: model.image?.asUrl)
        pokemonsName.text = model.name.capitalized
        pokemonAbilities.text = "Skills: \(model.abilities.joined(separator: ",").capitalized)"
    }
    
    func handleOutput(with output: HomeDetailPresenterOutput) {
        
    }
}
