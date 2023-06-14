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
    private let pokemonsName = CustomLabel(backgroundColor: .clear, textColor: .label, size: 28, textAlignment: .center)
    private let pokemonAbilities = CustomLabel(backgroundColor: .clear, textColor: .secondaryLabel, size: 25, textAlignment: .center)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pokemonImage, pokemonsName, pokemonAbilities])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    var presenter: HomeDetailPresenterProtocol!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter.load()
        layout()
    }
}

//MARK: - View Configure
extension HomeDetailView {
    
    private func layout() {
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        pokemonImage.contentMode = .scaleAspectFill
        pokemonImage.snp.makeConstraints { make in
            make.width.height.equalTo(175)
        }
    }
}

//MARK: - HomeDetailView
extension HomeDetailView: HomeDetailViewProtocol {

    func updateView(with model: CombinedArray) {
        pokemonImage.kf.setImage(with: model._image.asUrl)
        pokemonsName.text = model._name.capitalized
        pokemonAbilities.text = "Skills: \(model.abilities.joined(separator: ",").capitalized)"
    }
    
    func handleOutput(with output: HomeDetailPresenterOutput) {
    }
}
