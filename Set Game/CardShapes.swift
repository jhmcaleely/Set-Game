//
//  CardShapes.swift
//  Set Game
//
//  Created by John McAleely on 01/05/2021.
//

import SwiftUI

struct CardShapes {

    struct Diamond: Shape {
        func path(in rect: CGRect) -> Path {
            let path = Path(CardGeometry.Symbol.diamondPath)
            
            return path
        }
    }

    struct Squiggle: Shape {
        func path(in rect: CGRect) -> Path {
            let path = Path(CardGeometry.Symbol.squigglePath)
            
            return path
        }
    }

    struct Lozenge: Shape {
        func path(in rect: CGRect) -> Path {
            let path = Path(CardGeometry.Symbol.lozengePath)
            
            return path
        }
    }

}
