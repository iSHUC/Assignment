//
//  BreedImagesViewController.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import UIKit

class BreedImagesViewController: UIViewController {

    // MARK: - UI Properties
    
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    private lazy var viewModel: BreedImagesViewModel = {
        
        let service = APIService()
        return BreedImagesViewModel(service: service)
    }()
    
    var breed: String? {
        
        get { viewModel.breed }
        set { viewModel.breed = newValue }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    // MARK: - Configure View
    
    private func configureView() {
        
        title = viewModel.breed
        getBreedImage()
    }
    
    // MARK: - Get Breed Image
    
    private func getBreedImage() {

        guard let breed = breed else { return }
        Task {
            showLoader()
            do {
                let imageURL = try await viewModel.getBreedImageURL(breed)
                imageView?.setImage(from: imageURL, withPlaceholderImage: "placeholder")
                hideLoader()
            } catch {
                hideLoader()
                showError(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Refresh Image
    
    @IBAction private func didTapRefresh(_ sender: UIButton) {
        getBreedImage()
    }
}
