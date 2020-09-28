//
//  Photos.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

struct Photos: Decodable {
	let page: Int
	let pages: Int
	let perpage: Int
	let total: String
	let photo: [Photo]
}
