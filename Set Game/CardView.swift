//
//  CardView.swift
//  Set Game
//
//  Created by John McAleely on 02/05/2021.
//

import SwiftUI

extension SetCard {
    var uiColor: SwiftUI.Color {
        switch color {
        case .red: return SwiftUI.Color.red
        case .green: return SwiftUI.Color.green
        case .purple: return SwiftUI.Color.purple
        }
    }
}

struct CardSymbol: ViewModifier {
    var card: SetCard
    
    func body(content: Content) -> some View {
        content.opacity(card.shading == .striped ? 0.5 : 1.0)
            .foregroundColor(card.uiColor)
    }
}

extension Shape {
    func shaded(_ card: SetCard) -> some Shape {
        if card.shading == .open {
            return self.stroke(lineWidth: 3)
        }
        else {
            return self
        }
    }
}

func makeShape(_ card: SetCard) -> some View {
        switch card.symbol {
        case .diamond: return CardShapes.Diamond()
        case .oval: return CardShapes.Lozenge()
        case .squiggle: return CardShapes.Squiggle()
        }
}

struct AnyShape: Shape {
    private let builder: (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        builder = { rect in
            let path = shape.path(in: rect)
            return path
        }
    }

    func path(in rect: CGRect) -> Path {
        return builder(rect)
    }
}

//func makeCardShape(_ card: SetCard) -> some View {
//    let newShape: AnyShape = {
//        switch card.symbol {
//        case .diamond: return AnyShape(CardShapes.Diamond())
//        case .oval: return AnyShape(CardShapes.Lozenge())
//        case .squiggle: return AnyShape(CardShapes.Squiggle())
//        }
//    }()
//
//    switch card.shading {
//    case .open: return newShape.stroke(lineWidth: 3)
//    case .striped: return newShape.opacity(0.5)
//    case .solid: return newShape
//    }
//}

struct CardView: View {
    var card: SetCard
    
    var body: some View {
        switch card.number {
        case SetCard.Number.one:
            Group {
                makeShape(card).stroke(lineWidth: card.shading == .open ? 3 : 1)
            }.modifier(CardSymbol(card: card))
        case SetCard.Number.two:
            VStack {
                makeShape(card).stroke(lineWidth: card.shading == .open ? 3 : 1)
                makeShape(card).stroke(lineWidth: card.shading == .open ? 3 : 1)
            }.modifier(CardSymbol(card: card))
        case SetCard.Number.three:
            VStack {
                makeShape(card).stroke(lineWidth: card.shading == .open ? 3 : 1)
                makeShape(card).stroke(lineWidth: card.shading == .open ? 3 : 1)
                makeShape(card).stroke(lineWidth: card.shading == .open ? 3 : 1)
            }.modifier(CardSymbol(card: card))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetCard(number: .three, symbol: .diamond, shading: .solid, color: .green))
        CardView(card: SetCard(number: .two, symbol: .oval, shading: .open, color: .red))
        CardView(card: SetCard(number: .one, symbol: .squiggle, shading: .striped, color: .purple))
    }
}
