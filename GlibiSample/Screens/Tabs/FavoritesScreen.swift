//
//  FavoritesScreen.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct FavoritesScreen: View {
  var body: some View {
    NavigationStack {
      List(1..<3) { index in
        Text("Pelicula \(index)")
      }
    }
    .navigationTitle("Peliculas Favoritas")
  }
}

#Preview {
  NavigationStack {
    FavoritesScreen()
  }
}
