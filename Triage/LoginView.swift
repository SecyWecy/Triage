//
//  ContentView.swift
//  Triage
//
//  Created by Seth Onyango on 04/10/2020.
//

import SwiftUI
import CoreData
import GoogleSignIn
import FirebaseAuth

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        VStack {
            GoogleAuthRepresentable(authResult: handleGoogleAuthResult)
        }
    }
    
    private func handleGoogleAuthResult(result: Result<GIDGoogleUser, Error>){
        
        switch result {
        
        case .success(let user): do {
            guard let authentication = user.authentication else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (result, error) in
                
                // We are done
            }
        }
        case .failure(let error):
            print("\(error.localizedDescription)")

        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
