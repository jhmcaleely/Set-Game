//
//  ContentView.swift
//  Set Game
//
//  Created by John McAleely on 10/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardShapes.Lozenge()
            CardShapes.Squiggle()
            CardShapes.Diamond()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
