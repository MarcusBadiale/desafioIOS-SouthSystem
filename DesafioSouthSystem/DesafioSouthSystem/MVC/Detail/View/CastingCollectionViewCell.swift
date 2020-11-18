//
//  CastingCollectionViewCell.swift
//  DesafioSouthSystem
//
//  Created by Marcus Vinicius Vieira Badiale on 17/11/20.
//

import Foundation
import UIKit

class CastingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
    
    override func prepareForReuse() {
        actorImage.image = nil
    }
    
    func setCell(cast: Cast) {
        self.actorName.text = cast.name
        self.actorImage.layer.cornerRadius = 40
        self.actorImage.loadImageWithUrlString(string: API.API_FETCH_IMAGE + (cast.image ?? ""))
    }
}

