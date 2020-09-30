//
//  RequestMock.swift
//  MinGalleryTests
//
//  Created by Nicolau Atala on 29/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation
@testable import MinGallery

class RequestMock: URLRequestProtocol {
	
	var mockData: Data
	init(_ mockData: Data) {
		self.mockData = mockData
	}
	func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		completionHandler(mockData, HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil), nil)
		return URLSession.shared.dataTask(with: url)
	}
	
}

final class MockData {
	static var photos: Data {
		"""
		{
		"photos": {
		"page": 2,
		"pages": 2,
		"perpage": 20,
		"total": "23",
		"photo": [
		    {
		        "id": "42379233",
		        "owner": "80319262@N00",
		        "secret": "6132430646",
		        "server": "31",
		        "farm": 1,
		        "title": "Alfândega",
		        "ispublic": 1,
		        "isfriend": 0,
		        "isfamily": 0
		    }
					]
				},
			"stat": "ok"
		}
		""".data(using: .utf8)!
	}
	
	static var sizes: Data {
		"""
		{
		"sizes": {
		    "canblog": 0,
		    "canprint": 0,
		    "candownload": 1,
		    "size": [
		        {
		            "label": "Large Square",
		            "width": 150,
		            "height": 150,
		            "source": "https://live.staticflickr.com/65535/50396192416_f345243971_q.jpg",
		            "url": "https://www.flickr.com/photos/vonfer/50396192416/sizes/q/",
		            "media": "photo"
		        }
		    ]
		},
		"stat": "ok"
		}
		""".data(using: .utf8)!
	}
}
