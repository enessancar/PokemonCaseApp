//
//  HomeViewController.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    
    private var collectionView: UICollectionView!
    private var pokemonsModel: [CombinedArray] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter.load()
        setNavBarTitle()
        setCollectionDefaultLayout()
        configureLayout()
        configureCollectionView()
    }
    
    private func setNavBarTitle() {
        title = "Pokémon World"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func configureCollectionView() {
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func configureLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height)
        }
    }
    
    private func setCollectionDefaultLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
    }
}

//MARK: - UICollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonsModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
            fatalError()
        }
        let model = pokemonsModel[indexPath.item]
        cell.setPokemon(model: model)
        return cell
    }
}
//MARK: - UICollectionView Delegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter.selectPokemon(at: indexPath.item)
    }
}
//MARK: - UICollectionView DelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.frame.width
        return .init(width: width - 30, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}
//MARK: - HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func handleOutput(with output: HomePresenterOutput) {
        switch output {
        case .showFeedPokemons(let combinedArray):
            self.pokemonsModel = combinedArray
            self.collectionView.reloadData()
        }
    }
}


