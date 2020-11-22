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
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    @IBAction func addressIsRequested(_ sender: UIButton) {
        
    }
}

// MARK: - collectionview datasource delegation
extension HomeView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = Components.allCases[section]
        
        switch sectionType {
        case .ads:
            return adverts.count
        case .category:
            return categories.count
        case .suggestion:
            return suggestions.count
        case .offers:
            return offers.count
        case .insight:
            return brands.count
        case .shop:
            return shops.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Components.allCases[indexPath.section]
        
        switch sectionType {
        case .ads:
            return getAdsCell(collectionView: collectionView, indexPath: indexPath)
        case .category:
            return getCategoryCell(collectionView: collectionView, indexPath: indexPath)
        case .suggestion:
            return getSuggestionCell(collectionView: collectionView, indexPath: indexPath)
        case .offers:
            return getOffersCell(collectionView: collectionView, indexPath: indexPath)
        case .insight:
            return getBrandsCell(collectionView: collectionView, indexPath: indexPath)
        case .shop:
            return getMerchantsCell(collectionView: collectionView, indexPath: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = Components.allCases[indexPath.section]
        let cell = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as! HeaderCell
        cell.headerTitle.text = sectionType.sectionName
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
}

// MARK: - Methods for datasource
extension HomeView {
    private func getAdsCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AdsCell.reuseIdentifier, for: indexPath)
            as? AdsCell else {
                return UICollectionViewCell()
        }
        
        cell.populateView(with: adverts[indexPath.row])
        
        return cell
    }
    
    private func getCategoryCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath)
            as? CategoryCell else {
                return UICollectionViewCell()
        }
        
        cell.populateView(with: categories[indexPath.row])
        
        return cell
    }
    
    private func getSuggestionCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GoodSuggestionCell.reuseIdentifier, for: indexPath)
            as? GoodSuggestionCell else {
                return UICollectionViewCell()
        }
        
        cell.populateView(with: suggestions[indexPath.row])
        
        return cell
    }
    
    private func getOffersCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OffersCell.reuseIdentifier, for: indexPath)
            as? OffersCell else {
                return UICollectionViewCell()
        }
        
        cell.populateView(with: offers[indexPath.row])
        
        return cell
    }
    
    private func getBrandsCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BrandInsightCell.reuseIdentifier, for: indexPath)
            as? BrandInsightCell else {
                return UICollectionViewCell()
        }
        
        cell.populateView(with: brands[indexPath.row])
        
        return cell
    }
    
    private func getMerchantsCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ShopCell.reuseIdentifier, for: indexPath)
            as? ShopCell else {
                return UICollectionViewCell()
        }
        
        cell.populateView(with: shops[indexPath.row])
        
        return cell
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
        collectionView.dataSource = self
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
            case .offers:
                return buildOptionsCell(width: 0.25, height: 0.25)
            case .insight:
                return buildOptionsCell(width: 0.2, height: 0.2)
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
    private func buildOptionsCell(width: CGFloat, height: CGFloat) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(width),
            heightDimension: .fractionalWidth(height))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        section.boundarySupplementaryItems = [headerTitle()]
        
        return section
    }
    
    private func buildShopTypeCell() -> NSCollectionLayoutSection {
        let estimatedHeight = CGFloat(170)
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
