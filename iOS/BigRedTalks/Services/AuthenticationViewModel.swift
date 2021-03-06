//
//  AuthenticationViewModel.swift
//  BigRedTalks
//
//  Created by Fam Bam on 1/4/22.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthenticationViewModel: NSObject, ObservableObject {
    
    // 1
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    // 2
    @Published var state: SignInState = .signedOut
    @Published var isNewUser: Bool = false
    @Published var emailDomainAlert: String = " \n "
    
    // 3
    override init() {
        super.init()
        
        setupGoogleSignIn()
    }
    
    // 4
    func signIn() {
        if GIDSignIn.sharedInstance().currentUser == nil {
            GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    // 5
    func signOut() {
        GIDSignIn.sharedInstance().signOut()
        
        do {
            try Auth.auth().signOut()
            
            state = .signedOut
        } catch let signOutError as NSError {
            print(signOutError.localizedDescription)
        }
    }
    
    // 6
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
    }
}

extension AuthenticationViewModel: GIDSignInDelegate {
    
    // 1
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            
            let email: String = user!.profile.email
            let emailArr = email.components(separatedBy: "@")
            let domain: String = emailArr[1]
            
            if (domain == "cornell.edu"){
                firebaseAuthentication(withUser: user)
                emailDomainAlert = " \n "
            } else {
                emailDomainAlert = "Please use a cornell.edu email\n "
                GIDSignIn.sharedInstance().signOut()
            }
        } else {
            print(error.debugDescription)
        }
    }
    
    // 2
    private func firebaseAuthentication(withUser user: GIDGoogleUser) {
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (result, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.state = .signedIn
                    guard let newUserStatus = result?.additionalUserInfo?.isNewUser else {return}
                    self.isNewUser = newUserStatus
                }
            }
        }
    }
}
