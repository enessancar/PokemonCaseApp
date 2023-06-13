//
//  Extension.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
