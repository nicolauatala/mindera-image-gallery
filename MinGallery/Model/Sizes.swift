//
//  Sizes.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

struct SizesResponse: Decodable {
	let sizes: Sizes
	let stat: String
}

struct Sizes: Decodable {
	let canblog: Int
	let canprint: Int
	let candownload: Int
	let size: [Size]
}

struct Size: Decodable, Equatable {
	let label: String
	let width: Int
	let height: Int
	let source: String
	let url: String
	let media: String
	
	static func ==(lhs: Size, rhs: Size) -> Bool {
		return lhs.label == rhs.label
	}
}
