//
//  GalleryViewModelMock.swift
//  MinGalleryTests
//
//  Created by Nicolau Atala on 29/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation
@testable import MinGallery

class GalleryViewModelMock: GalleryViewModelProtocol {
	var service = GalleryService()
	var page: Int = 1
	var searches: Box<[Photos]> = Box([])
	var tag: Box<String> = Box("")
	
	func loadGallery(tag: String) {
		let requestMock = RequestMock(MockData.photos)
		let service = GalleryService(session: requestMock)
		service.fetchPhotos("cat", page: 1) { (result) in
			switch result {
			case .success(let photos):
				self.searches.value = [photos]
				self.page = 1
				self.tag.value = tag
			case .failure(let error):
				print("error \(error)")
			}
		}
	}
	
	func getSquareImage(id: String, completion: @escaping (URL) -> Void) {
		let justURL = URL(string: FlickrAPI.sizes("123").path)!
		completion(justURL)
	}
	
	
}
