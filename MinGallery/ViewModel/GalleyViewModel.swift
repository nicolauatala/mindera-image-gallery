//
//  GalleyViewModel.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

class GalleryViewModel {
	
	private let service = GalleryService()
	var searches: Box<[Photos]> = Box([])
	
	init() {
	}
	
	func loadGallery(tag: String) -> Void {
		service.fetchPhotos(tag) { result in
			switch result {
			case .success(let photos):
				self.searches.value = [photos]
			case .failure(let error):
				print(error.localizedDescription)
			}
			
		}
	}
}
