//
//  Coordinator.swift
//  MinGallery
//
//  Created by Nicolau Atala on 24/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

protocol Coordinator {
	func start()
	func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
	func coordinate(to coordinator: Coordinator) {
		coordinator.start()
	}
}
