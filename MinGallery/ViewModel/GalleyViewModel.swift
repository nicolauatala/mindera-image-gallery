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
	private var page = 1
	var tag = Box("")
	
	init() {
	}
	
	func loadGallery(tag: String) -> Void {
		service.fetchPhotos(tag, page: page) { result in
			switch result {
			case .success(let photos):
				self.searches.value += [photos]
				self.page += 1
				print(self.searches.value.count)
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
}
