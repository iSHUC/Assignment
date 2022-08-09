//
//  BreedsViewController.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import UIKit

class BreedsViewController: UIViewController {
    
    // MARK: - UI Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private lazy var viewModel: BreedsViewModel = {
        
        let service = APIService()
        return BreedsViewModel(service: service)
    }()
    
    private var breeds = [String]()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    // MARK: - Configure View
    
    private func configureView() {
        
        title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        getBreeds()
    }
    
    // MARK: - Get Breeds
    
    private func getBreeds() {
        
        Task {
            showLoader()
            do {
                breeds = try await viewModel.getBreeds()
                tableView.reloadData()
                hideLoader()
            } catch {
                hideLoader()
                showError(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.breedsToBreedImages {
            
            let breedImagesViewController = segue.destination as? BreedImagesViewController
            breedImagesViewController?.breed = sender as? String
        }
    }
}

// MARK: - Table View Data Source

extension BreedsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: BreedsTableViewCell.identifier, for: indexPath) as? BreedsTableViewCell
        else {
            return UITableViewCell()
        }
        
        let breed = breeds[indexPath.row]
        cell.configure(breed)
        return cell
    }
}

// MARK: - Table View Delegate

extension BreedsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let breed = breeds[indexPath.row]
        performSegue(withIdentifier: Segues.breedsToBreedImages, sender: breed)
    }
}
