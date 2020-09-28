//
//  PhotoCollectionViewCell.swift
//  MinGallery
//
//  Created by Nicolau Atala on 28/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var imageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		imageView.layer.cornerRadius = 8
		imageView.layer.masksToBounds = true
	}
}
