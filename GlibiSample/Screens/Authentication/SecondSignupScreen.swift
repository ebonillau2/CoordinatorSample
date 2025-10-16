//
//  SecondSignupScreen.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct SecondSignupScreen: View {
  @EnvironmentObject private var coordinator: AuthCoordinator
  @State private var password: String = ""
  @State private var confirmPassword: String = ""
  @State private var isSecure: Bool = true
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Contraseña")
        .font(.subheadline)
        .padding(.bottom, 5)
      
      HStack {
        if isSecure {
          SecureField("Ingresa tu contraseña", text: $password)
        } else {
          TextField("Ingresa tu contraseña", text: $password)
        }
        Button(action: {
          isSecure.toggle()
        }) {
          Image(systemName: isSecure ? "eye.slash" : "eye")
            .foregroundColor(.gray)
        }
      }
      .padding()
      .background(Color(.secondarySystemBackground))
      .cornerRadius(5)
      .padding(.bottom, 20)
      
      Text("Confirma Contraseña")
        .font(.subheadline)
        .padding(.bottom, 5)
      
      HStack {
        if isSecure {
          SecureField("Confirma tu contraseña", text: $confirmPassword)
        } else {
          TextField("Confirma tu contraseña", text: $confirmPassword)
        }
        Button(action: {
          isSecure.toggle()
        }) {
          Image(systemName: isSecure ? "eye.slash" : "eye")
            .foregroundColor(.gray)
        }
      }
      .padding()
      .background(Color(.secondarySystemBackground))
      .cornerRadius(5)
      
      Button(action: {
        coordinator.popToRoot()
      }) {
        Text("Registrese")
          .foregroundColor(.white)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
          .padding(.horizontal, 30)
      }
      .padding(.top, 30)
    }
    .padding(.horizontal, 30)
    .navigationTitle("Crea una contraseña")
  }
}

#Preview {
  SecondSignupScreen()
}
