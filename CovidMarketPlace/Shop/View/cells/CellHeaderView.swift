//
//  CellHeaderView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 29/11/2020.
//

import UIKit

class CellHeaderView: UIView {
    var cellTitle: UILabel = {
        let label = UILabel()
        label.text = "Random name section"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var toggleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "greaterthan")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var btnTapAction : (()->())?
    
    var cellState: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Methods for view configuration
extension CellHeaderView {
    private func configView() {
        let tap = UITapGestureRecognizer(
            target: self, action: #selector(cellIsTapped))
        addGestureRecognizer(tap)
        addSubview(cellTitle)
        addSubview(toggleImage)
        configLayouts()
    }
    
    @objc func cellIsTapped() {
        cellState.toggle()
        toggleImage.image = cellState ? UIImage(systemName: "chevron.compact.down") : UIImage(systemName: "greaterthan")
        btnTapAction?()
    }
    
    fileprivate func constraintTitle() {
        NSLayoutConstraint.activate([
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .minimumSpacing*3),
            cellTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellTitle.trailingAnchor.constraint(equalTo: toggleImage.leadingAnchor, constant: .minimumSpacing*2)
        ])
    }
    
    fileprivate func constraintImage() {
        NSLayoutConstraint.activate([
            toggleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.minimumSpacing*3),
            toggleImage.centerYAnchor.constraint(equalTo: cellTitle.centerYAnchor),
            toggleImage.widthAnchor.constraint(equalToConstant: 20),
            toggleImage.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configLayouts() {
        constraintTitle()
        constraintImage()
    }
    
}
