//
//  GoogleAuthRepresentable.swift
//  Triage
//
//  Created by Seth Onyango on 04/10/2020.
//

import SwiftUI
import GoogleSignIn

struct GoogleAuthRepresentable: UIViewRepresentable {
    let authResult: (Result<GIDGoogleUser, Error>) -> Void
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(authResult: authResult)
    }
    
    func makeUIView(context: Context) -> GIDSignInButton {
        GIDSignIn.sharedInstance().delegate = context.coordinator
        
        let button = GIDSignInButton()
        button.addTarget(self, action: #selector(context.coordinator.doGoogleGoogleLogin), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
    }
    
    
    
    
    class Coordinator: NSObject, GIDSignInDelegate{
        let authResult: (Result<GIDGoogleUser, Error>) -> Void

        init(authResult: @escaping (Result<GIDGoogleUser, Error>) -> Void) {
            self.authResult = authResult
        }
        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
            
            // TODO: Handle errors that might occur
            authResult(.success(user))
        }
        
        @objc func doGoogleGoogleLogin(){
            GIDSignIn.sharedInstance().signIn()
        }
        
    }
    
}
