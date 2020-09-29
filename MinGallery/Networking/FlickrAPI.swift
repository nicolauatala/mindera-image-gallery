//
//  FlickrAPI.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

fileprivate let apiKey = "f9cc014fa76b098f9e82f1c288379ea1"

protocol EndPointType {
	var baseURL: String { get }
	var path: String { get }
}

public enum FlickrAPI {
	case search(_ tag: String, _ page: Int)
	case sizes(_ id: String)
}

extension FlickrAPI: EndPointType {
	
	var baseURL: String {
		return "https://api.flickr.com/services/rest/?method="
	}
	
	var path: String {
		switch self {
		case .search(let tag, let page):
			return"\(baseURL)flickr.photos.search&api_key=\(apiKey)&tags=\(tag)&page=\(page)&per_page=20&format=json&nojsoncallback=1"
		case .sizes(let id):
			return"\(baseURL)flickr.photos.getSizes&api_key=\(apiKey)&photo_id=\(id)&format=json&nojsoncallback=1"
		}
	}
	
}
