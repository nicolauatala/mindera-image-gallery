//
//  GalleryService.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

let apiKey = "f9cc014fa76b098f9e82f1c288379ea1"

enum FetchError: Error {
	case invalidRequest
	case noData
	case invalidFormat
}

protocol URLRequestProtocol {
	func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLRequestProtocol {}

class GalleryService {
	
	private let session: URLRequestProtocol
	
	init(session: URLRequestProtocol = URLSession.shared) {
		self.session = session
	}
	
	func fetchPhotos(_ tag: String, page: Int, completion: @escaping (Result<Photos, FetchError>) -> Void) {
		
		let URLString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&tags=\(tag)&page=\(page)&per_page=20&format=json&nojsoncallback=1"
		
		guard let api = URL(string: URLString) else {
			return
		}
		
		let task = session.dataTask(with: api) { (data, response, error) in
			
			guard error == nil else {
				completion(.failure(.invalidFormat))
				return
			}
			
			guard let response = response as? HTTPURLResponse else {
				completion(.failure(.noData))
				return
			}
			
			guard response.statusCode == 200 else {
				return
			}
			
			guard let jsonData = data else {
				return
			}
			
			do {
				let decoder = JSONDecoder()
				let decoded = try decoder.decode(FlickrResponse.self, from: jsonData)
				
				completion(.success(decoded.photos))
			} catch {
				completion(.failure(.invalidFormat))
			}
		}
		
		task.resume()
	}
}
