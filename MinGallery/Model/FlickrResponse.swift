//
//  FlickerResponse.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import Foundation

struct FlickrResponse: Decodable {
	let photos: Photos
	let stat: String
}
