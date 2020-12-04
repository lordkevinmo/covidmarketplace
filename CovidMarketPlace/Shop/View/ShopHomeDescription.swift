//
//  ShopHomeDescription.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 29/11/2020.
//

import UIKit

class ShopHomeDescription: UIViewController {
    
    enum Section {
        case main
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Product>! = nil
    var collectionView: UICollectionView! = nil
    
    //static let storyboardID = "shop-home-description"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Carrefour Market"
    }
}

extension ShopHomeDescription {
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.30))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGray6
        collectionView.register(
            UINib(nibName: "ProductsCell", bundle: nil),
            forCellWithReuseIdentifier: ProductsCell.reuseIdentifier
        )
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Product>(collectionView: collectionView) {
            (collectionView: UICollectionView,
             indexPath: IndexPath, product: Product) -> UICollectionViewCell? in

            // Get a cell of the desired kind.
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductsCell.reuseIdentifier,
                for: indexPath) as? ProductsCell else { fatalError("Cannot create new cell") }

            // Populate the cell with our item description.
            cell.populateProduct(product: product)
            // Return the cell.
            return cell
        }

        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension ShopHomeDescription: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ProductViewRouter.assembleModule(), animated: true)
    }
}
