//
//  LayoutBuilder.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

class LayoutBuilder {
    
    static func buildSettingsSection(itemWidth: CGFloat, itemHeight: CGFloat, groupWidth: CGFloat, groupHeight: CGFloat, groupLength: Int) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemWidth), heightDimension: .fractionalHeight(itemHeight)))
        
        let spacing = CGFloat(1)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0.0, bottom: 16.0, trailing: 0.0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupWidth),  heightDimension: .fractionalWidth(groupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16.0, leading: 0.0, bottom: 16.0, trailing: 0.0)
        section.interGroupSpacing = spacing
        return section
    }
    
    static func buildItemSection(itemWidth: CGFloat, itemHeight: CGFloat, groupWidth: CGFloat, groupHeight: CGFloat, groupLength: Int) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(itemWidth), heightDimension: .fractionalHeight(itemHeight)))
        
        let spacing = CGFloat(1)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(groupWidth),
            heightDimension: .fractionalWidth(groupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        section.interGroupSpacing = spacing
        return section
    }
    
    static func buildSectionTitle() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        let spacing = CGFloat(1)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(56))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        section.interGroupSpacing = spacing
        return section
    }
    
    static func buildEmptySectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.1)))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .fractionalHeight(0.00000001))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
