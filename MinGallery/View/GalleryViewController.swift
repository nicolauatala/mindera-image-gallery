//
//  GalleryViewController.swift
//  MinGallery
//
//  Created by Nicolau Atala on 24/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class GalleryViewController: UICollectionViewController {
	
	private let sectionInsets = UIEdgeInsets(top: 16.0,
																					 left: 16.0,
																					 bottom: 0.0,
																					 right: 16.0)
	
	private let itemsPerRow: CGFloat = 2
	
	private let viewModel = GalleryViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewModel.searches.bind { [weak self] searches in
			DispatchQueue.main.async {
				self?.collectionView.reloadData()
			}
		}
		
		viewModel.tag.bind { [weak self] tag in
			self?.viewModel.loadGallery(tag: tag)
		}
		
		viewModel.tag.value = "cat"
	}
	
	// MARK: UICollectionViewDataSource
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return viewModel.searches.value.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.searches.value[section].photo.count
		
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath ) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
		let flickrPhoto = photo(for: indexPath)
		cell.backgroundColor = .clear
		
		if let imageURL = flickrPhoto.flickrImageURL() {
			cell.imageView?.load(url: imageURL)
		}
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

		let index =  IndexPath(item: 10, section: viewModel.searches.value.count - 1)
		if indexPath == index {
			viewModel.loadGallery(tag: viewModel.tag.value)
		}
	}
	
}

private extension GalleryViewController {
	func photo(for indexPath: IndexPath) -> Photo {
		return viewModel.searches.value[indexPath.section].photo[indexPath.row]
	}
}

extension GalleryViewController : UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView,
											layout collectionViewLayout: UICollectionViewLayout,
											sizeForItemAt indexPath: IndexPath) -> CGSize {
		let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
		let availableWidth = view.frame.width - paddingSpace
		let widthPerItem = availableWidth / itemsPerRow
		
		return CGSize(width: widthPerItem, height: widthPerItem)
	}
	
	func collectionView(_ collectionView: UICollectionView,
											layout collectionViewLayout: UICollectionViewLayout,
											insetForSectionAt section: Int) -> UIEdgeInsets {
		return sectionInsets
	}
	
	func collectionView(_ collectionView: UICollectionView,
											layout collectionViewLayout: UICollectionViewLayout,
											minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return sectionInsets.left
	}
}
