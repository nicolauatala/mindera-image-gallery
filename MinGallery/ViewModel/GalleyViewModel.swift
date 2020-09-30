//
//  GalleyViewModel.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

class GalleryViewModel: GalleryViewModelProtocol {
	
	internal let service = GalleryService()
	internal var page = 1
	var searches: Box<[Photos]> = Box([])
	var tag = Box("")
	
	init() {
	}
	
	func loadGallery(tag: String) {
		let newTag = self.tag.value != tag
		self.tag.value = tag
		service.fetchPhotos(tag, page: page) { result in
			switch result {
			case .success(let photos):
				self.manageSearchesResult(newTag: newTag, photos)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	private func manageSearchesResult(newTag: Bool,_ photos: Photos) {
		if newTag {
			self.searches.value = [photos]
			self.page = 1
		} else {
			self.searches.value += [photos]
			self.page += 1
		}
	}
	
	func getSquareImage(id: String, completion: @escaping(URL) -> Void) {
		service.sizesURLs(id) { result in
			switch result {
			case .success(let sizes):
				if let index = sizes.firstIndex(where: { $0.label == "Large Square" }) {
					guard let urlImageLargeSquare = URL(string: sizes[index].source) else {
						return
					}
					completion(urlImageLargeSquare)
				}
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
}
