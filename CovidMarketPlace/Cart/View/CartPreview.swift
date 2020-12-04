//
//  CartPreview.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

class CartPreview: UIViewController {
    @IBOutlet weak var previewTitle: UILabel!
    @IBOutlet weak var quantityTitle: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var addcartBtn: UIButton!
    
    static let storyboardID = "cart-preview"
    
    var tableView: UITableView! = nil
    
    var model: [Model]!
    
    var selectedRow: Int = -1
    
    var selectedModel: Model!
    
    var floatingButtonController = FloatingButtonController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configHierarchy()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBAction func quantityDidChanged(_ sender: UIStepper) {
        quantity.text = Int(sender.value).description
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        floatingButtonController.button.isHidden = false
    }
}

// MARK: Methods
extension CartPreview {
    private func setupView() {
        previewTitle.text = "Choose the model and the quantity then it will be all good :)"
        quantityTitle.text = "Quality"
        model = models
        
        floatingButtonController.button.addTarget(
            self, action: #selector(floatingButtonWasTapped), for: .touchUpInside)
        
        floatingButtonController.button.isHidden = true
    }
    
    private func configStepper() {
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 10
    }
    
    private func configHierarchy() {
        configStepper()
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableView.register(
            UINib(nibName: "CartModelCell", bundle: nil),
            forCellReuseIdentifier: CartModelCell.reuseIdentifier)
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func floatingButtonWasTapped() {
        let newV = UIViewController()
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow?.rootViewController?.present(newV, animated: true, completion: nil)
    }
}

extension CartPreview: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CartModelCell.reuseIdentifier, for: indexPath) as! CartModelCell
        let selectedMod = model[indexPath.row]
//
//        if selectedModel.isSelected {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        cell.populateView(with: selectedMod)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .minimumSpacing * 5
    }
}

extension CartPreview: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedModel = models[indexPath.row]
        selectedRow = indexPath.row
        for cell in tableView.visibleCells {
            cell.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.accessoryType = indexPath.row == selectedRow ? .checkmark : .none
    }
}
