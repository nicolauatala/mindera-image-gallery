//
//  GalleryProtocols.swift
//  MinGallery
//
//  Created by Nicolau Atala on 29/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

protocol GalleryViewModelProtocol: class {
	var service: GalleryService { get }
	var page: Int { get }
	var searches: Box<[Photos]> { get set }
	var tag: Box<String> { get set }
	func loadGallery(tag: String)
	func getSquareImage(id: String, completion: @escaping(URL) -> Void)
}
