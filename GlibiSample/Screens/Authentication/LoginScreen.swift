//
//  LoginScreen.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct LoginScreen: View {
  @EnvironmentObject private var coordinator: AuthCoordinator
  @Environment(AuthManager.self) private var authManager
  
  @State private var username: String = ""
  @State private var password: String = ""
  @State private var isSecure: Bool = true
  
  var body: some View {
    VStack {
      topView
      
      loginForm
        .padding(.horizontal, 30)
      
      Button(action: {
        authManager.currentUser = true
      }) {
        Text("Iniciar Sesion")
          .foregroundColor(.white)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
          .padding(.horizontal, 30)
      }
      .padding(.top, 30)
      
      VStack {
        Button(action: {
          coordinator.presentSheet(.forgotPassword)
        }) {
          Text("Olvidaste tu contraseña")
            .foregroundColor(.blue)
        }
        .padding(.top, 20)
        
        HStack {
          Text("Aun no tienes una cuenta?")
          Button(action: {
            coordinator.push(page: .signup)
          }) {
            Text("Registrate")
              .foregroundColor(.blue)
          }
        }
        .padding(.vertical, 20)
      }
    }
  }
}

// Views
private extension LoginScreen {
  @ViewBuilder var topView: some View {
    Text("Bienvenido")
      .font(.largeTitle)
      .fontWeight(.semibold)
      .padding(.bottom, 20)
    
    Image(systemName: "person.circle.fill")
      .resizable()
      .frame(width: 80, height: 80)
      .foregroundColor(.blue)
      .padding(.bottom, 40)
  }
  
  var loginForm: some View {
    VStack(alignment: .leading) {
      Text("Usuario")
        .font(.subheadline)
        .padding(.bottom, 5)
      
      TextField("Ingrese un nombre de usuario", text: $username)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(5)
        .padding(.bottom, 20)
      
      Text("Contraseña")
        .font(.headline)
        .padding(.bottom, 5)
      
      HStack {
        if isSecure {
          SecureField("Ingrese su contraseña", text: $password)
        } else {
          TextField("Ingrese su contraseña", text: $password)
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
    }
  }
}

#Preview {
  NavigationStack {
    LoginScreen()
      .environment(AuthManager())
  }
}
