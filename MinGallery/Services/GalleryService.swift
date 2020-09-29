//
//  GalleryService.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

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
	
	private func get<T: Decodable>(_ url: String, completion: @escaping (Result<T, FetchError>) -> Void) {
		
		guard let api = URL(string: url) else {
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
				let decoded = try decoder.decode(T.self, from: jsonData)
				
				completion(.success(decoded))
			} catch {
				completion(.failure(.invalidFormat))
			}
		}
		
		task.resume()
	}

	func fetchPhotos(_ tag: String, page: Int, completion: @escaping (Result<Photos, FetchError>) -> Void) {
		let urlString = FlickrAPI.search(tag, page)
		get(urlString.path) { (result: Result<FlickrResponse, FetchError>) in
			switch result {
			case .success(let response):
				completion(.success(response.photos))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
	
	func sizesURLs(_ id: String, completion: @escaping (Result<[Size], FetchError>) -> Void) {
		let urlString = FlickrAPI.sizes(id)
		get(urlString.path) { (result: Result<SizesResponse, FetchError>) in
			switch result {
			case .success(let response):
				completion(.success(response.sizes.size))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
