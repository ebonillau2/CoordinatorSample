//
//  SignupScreen.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct SignupScreen: View {
  @EnvironmentObject private var coordinator: AuthCoordinator
  @State private var username: String = ""
  @State private var email: String = ""
  
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text("Usuario")
          .font(.subheadline)
          .padding(.bottom, 5)
        
        TextField("Ingrese un nombre de usuario", text: $username)
          .padding()
          .background(Color(.secondarySystemBackground))
          .cornerRadius(5)
          .padding(.bottom, 20)
        
        Text("Correo Electronico")
          .font(.subheadline)
          .padding(.bottom, 5)
        
        TextField("Ingrese su correo electronico", text: $email)
          .padding()
          .background(Color(.secondarySystemBackground))
          .cornerRadius(5)
          .padding(.bottom, 20)
        
        Button(action: {
          coordinator.push(page: .secondSignup)
        }) {
          Text("Siguiente")
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal, 30)
        }
        .padding(.top, 30)
        
        Button(action: {
          coordinator.pop()
        }) {
          Text("Ya tienes una cuenta?")
            .foregroundColor(.blue)
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity)
      }
      .padding(.horizontal, 30)
    }
    .navigationTitle("Registra tus datos")
  }
}

#Preview {
  NavigationStack {
    SignupScreen()
  }
}
