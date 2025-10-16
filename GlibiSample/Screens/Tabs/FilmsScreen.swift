//
//  FilmsScreen.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct FilmsScreen: View {
  var body: some View {
    NavigationStack {
      List(1..<10) { index in
        Text("Pelicula \(index)")
      }
    }
    .navigationTitle("Peliculas Ghibli")
  }
}

#Preview {
  NavigationStack {
    FilmsScreen()
  }
}
