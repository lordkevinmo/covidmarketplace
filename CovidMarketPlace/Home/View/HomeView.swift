//
//  HomeView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 13/11/2020.
//

import UIKit

fileprivate enum Components: Int, CaseIterable {
    case ads, category, suggestion, offers, insight , shop
    
    var sectionName: String {
        switch self {
        case .ads:
            return ""
        case .category:
            return "Categories"
        case .suggestion:
            return "Based on your latest purchase"
        case .offers:
            return "Latest offers"
        case .insight:
            return "Top brands in spotlight"
        case .shop:
            return "Merchants around you"
        }
    }
    
    func columnCount(for width: CGFloat) -> Int {
        let widthMode = width > 800
        switch self {
        case .ads:
            return 1
        case .category:
            return widthMode ? 6: 4
        case .suggestion:
            return widthMode ? 4 : 3
        case .offers, .insight, .shop:
            return 0
        }
    }
}

class HomeView: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var addressLabel: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    static let storyboardID = "home-view"
    
    // identifier of section header in collectionview
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    var collectionView: UICollectionView! = nil
    
    var address: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        addressLabel.setTitle(address, for: .normal)
    }

    @IBAction func addressIsRequested(_ sender: UIButton) {
        
    }
}

// MARK: - Methods for cells configuration
extension HomeView {
    private func setupCollectionView() {
        // Init the collectionview
        collectionView = UICollectionView(
            frame: container.bounds, collectionViewLayout: createLayout())
        // define the resizing behaviour
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // define background color
        collectionView.backgroundColor = .systemBackground
        // add collectionview to the container view
        container.addSubview(collectionView)
        // register the cells
        collectionView.register(
            UINib(nibName: "AdsCell", bundle: nil),
            forCellWithReuseIdentifier: AdsCell.reuseIdentifier)
        collectionView.register(
            UINib(nibName: "CategoryCell", bundle: nil),
            forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        collectionView.register(
            UINib(nibName: "GoodSuggestionCell", bundle: nil),
            forCellWithReuseIdentifier: GoodSuggestionCell.reuseIdentifier)
        collectionView.register(
            UINib(nibName: "OffersCell", bundle: nil),
            forCellWithReuseIdentifier: OffersCell.reuseIdentifier)
        collectionView.register(
            UINib(nibName: "BrandInsightCell", bundle: nil),
            forCellWithReuseIdentifier: BrandInsightCell.reuseIdentifier)
        collectionView.register(
            UINib(nibName: "ShopCell", bundle: nil),
            forCellWithReuseIdentifier: ShopCell.reuseIdentifier)
        collectionView.register(
            UINib(nibName: "HeaderCell", bundle: nil),
            forSupplementaryViewOfKind: HomeView.sectionHeaderElementKind,
            withReuseIdentifier: HeaderCell.reuseIdentifier)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout {
            [unowned self] (section: Int,
                            layoutEnvironment: NSCollectionLayoutEnvironment
            ) -> NSCollectionLayoutSection? in
            
            let width = layoutEnvironment.container.effectiveContentSize.width
            
            let sectionLayoutKind = Components.allCases[section]
            
            switch sectionLayoutKind {
            case .ads, .category, .suggestion:
                return buildColumnsCell(sectionIndex: section, width: width)
            case .offers, .insight:
                return buildOptionsCell()
            case .shop:
                return buildShopTypeCell()
            }
        }
        
        return layout
    }
    
    
    /// buildColumnsCell config the size and the behaviour of the cell in the collectionview
    /// - Parameters:
    ///   - sectionIndex: index of the section (should correspond to a case of Components enumeration)
    ///   - width: is the width of the layout environment (device real screen width size)
    /// - Returns: the built NSCollectionLayoutSection instance
    private func buildColumnsCell(sectionIndex: Int, width: CGFloat) -> NSCollectionLayoutSection? {
        guard let sectionLayoutKind = Components(rawValue: sectionIndex) else { return nil }
        
        let columns = sectionLayoutKind.columnCount(for: width)
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupHeight = CGFloat(sectionLayoutKind == .ads ? 0.4 : 0.3)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(groupHeight))
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitem: item, count: columns)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        section.boundarySupplementaryItems = [headerTitle()]
        
        return section
    }
    
    /// build horizontal scrolling collectionview cell type behaviour and setup the cell size
    /// - Returns: the built NSCollectionSection instance
    private func buildOptionsCell() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .fractionalWidth(0.3))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        section.boundarySupplementaryItems = [headerTitle()]
        
        return section
    }
    
    private func buildShopTypeCell() -> NSCollectionLayoutSection {
        let estimatedHeight = CGFloat(250)
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(estimatedHeight))
        let item = NSCollectionLayoutItem(layoutSize: layoutSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize,
                                                       subitem: item,
                                                       count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 10
        
        section.boundarySupplementaryItems = [headerTitle()]
        
        return section
    }
    
    private func headerTitle() -> NSCollectionLayoutBoundarySupplementaryItem {
        let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(44))
        
        let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: titleSize,
            elementKind: HomeView.sectionHeaderElementKind,
            alignment: .top)
        
        return titleSupplementary
    }
}
