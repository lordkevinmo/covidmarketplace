//
//  AutoCompleteView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 12/11/2020.
//

import UIKit
import MapKit

class AutoCompleteView: UITableViewController {
    
    static let storyBoardID = "place-autocomplete"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let completion = searchResults[indexPath.row]
        
        let searchRequest = MKLocalSearch.Request(completion: completion)
        let search = MKLocalSearch(request: searchRequest)
        search.start {(response, error) in
            if let placemark = response?.mapItems[0].placemark {
                var autoresponse = AutoComplete()
                autoresponse.address = placemark.title
                autoresponse.locality = placemark.locality
                autoresponse.country = placemark.country
                autoresponse.latitude = placemark.coordinate.latitude
                autoresponse.longitude = placemark.coordinate.longitude
                autoresponse.postalCode = placemark.postalCode
                autoresponse.isoCode = placemark.isoCountryCode != nil ? placemark.isoCountryCode! : ""
                
                NotificationCenter.default.post(
                    name: .didPlaceAutocompleted, object: nil,
                    userInfo: [String.autocompleteplace : autoresponse]
                )
            }
        }
        self.searchController.isActive = false
        self.dismiss(animated: true, completion: nil)
    }

}

extension AutoCompleteView: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        placeSearchText(searchBar.text!)
    }
    
}

extension AutoCompleteView: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        tableView.reloadData()
    }
}

extension AutoCompleteView: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Methods
extension AutoCompleteView {
    private func setupSearchController() {
        // 1
        searchController.searchResultsUpdater = self
        searchCompleter.delegate = self
        
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        
        // 3
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.showsCancelButton = true
        searchController.searchBar.placeholder = "Search an address"
        searchController.searchBar.delegate = self
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
    }
    
    private func placeSearchText(_ searchText: String) {
        searchCompleter.queryFragment = searchText
    }
}


