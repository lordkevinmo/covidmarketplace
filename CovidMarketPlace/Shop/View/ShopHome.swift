//
//  ShopHome.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 28/11/2020.
//

import UIKit

class ShopHome: UITableViewController {
    static let storyboardID = "shop-home-view"
    
    let reuseIdentifier = "cellId"
    
    var contents = [
        ShopCategory(category: "Vêtements Homme", isExpanded: false,
                     subCategories: [
                        Category(categoryName: "Blousons", image: #imageLiteral(resourceName: "clothes"))]),
        ShopCategory(category: "Chaussures Homme", isExpanded: false,
                     subCategories: [
                        Category(categoryName: "Addidas", image: #imageLiteral(resourceName: "clothes")),
                        Category(categoryName: "Nike", image: #imageLiteral(resourceName: "clothes")),
                        Category(categoryName: "Puma", image: #imageLiteral(resourceName: "clothes"))
                     ]),
        ShopCategory(category: "Alimentation générale", isExpanded: false,
                     subCategories: [
                        Category(categoryName: "Boîte de conserve", image: #imageLiteral(resourceName: "flower")),
                        Category(categoryName: "Produits laitiers", image: #imageLiteral(resourceName: "dish")),
                        Category(categoryName: "Lessives et vaisselles", image: #imageLiteral(resourceName: "clip-travel")),
                        Category(categoryName: "Fruits et légumes", image: #imageLiteral(resourceName: "vegetables"))
                     ]),
        ShopCategory(category: "Vêtements Femme", isExpanded: false,
                     subCategories: [])
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configHeaderView()
        configTableview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !contents[section].isExpanded {
            return 0
        }
        return contents[section].subCategories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ShopHomeCell.reuseIdentifier, for: indexPath) as! ShopHomeCell
        let subCategory = contents[indexPath.section].subCategories[indexPath.row]
        cell.subCategoryImg.image = subCategory.image
        cell.subCategoryLabel.text = subCategory.categoryName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CellHeaderView()
        let title = contents[section].category
        header.cellTitle.text = title
        header.tag = section
        
        header.btnTapAction = {
            [unowned self] in
            var indexPaths = [IndexPath]()
            for row in contents[section].subCategories.indices {
                let indexpath = IndexPath(row: row, section: section)
                indexPaths.append(indexpath)
            }
            
            let isExpanded = contents[section].isExpanded
            contents[section].isExpanded = !isExpanded
            
            if contents[section].subCategories.count > 0 {
                if isExpanded {
                    tableView.deleteRows(at: indexPaths, with: .fade)
                } else {
                    tableView.insertRows(at: indexPaths, with: .fade)
                }
            } else {
                navigationController?.pushViewController(
                    ShopHomeDescription(), animated: true)
            }
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(75)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .init(50)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contents.count
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let header = tableView.tableHeaderView as! HeaderView
        header.scrollViewDidScroll(scrollView: scrollView)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

// MARK: @Methods
extension ShopHome {
    private func configHeaderView() {
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        header.imageView.image = #imageLiteral(resourceName: "flower")
        tableView.tableHeaderView = header
    }
    
    private func configTableview() {
        tableView.register(
            UINib(nibName: "ShopHomeCell", bundle: nil),
            forCellReuseIdentifier: ShopHomeCell.reuseIdentifier)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configNavigationBar() {
        // Make the Navigation Bar background transparent
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController?.navigationBar.shadowImage = UIImage()
        //navigationController?.navigationBar.isTranslucent = true
        //navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true

        // Remove 'Back' text and Title from Navigation Bar
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        title = "Carrefour Market"
    }

}
