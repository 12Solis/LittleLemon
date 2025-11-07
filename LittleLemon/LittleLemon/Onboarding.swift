//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 06/11/25.
//


import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "is logged in key"


struct Onboarding: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedIn = false
    
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack{
                
                TextField("First Name:",text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding(.horizontal)
                TextField("Last Name:",text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding(.horizontal)
                TextField("Email:",text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.horizontal)
                
                Button("Register"){
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        if isValidEmailFormat(email: email) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            
                            isLoggedIn = true
                            
                        }else{
                            print( "Invalid Email Format")
                            alertMessage = "Invalid Email Format"
                            showingAlert = true
                            
                        }
                        
                    }
                    
                    
                }
                .foregroundStyle(.white)
                .padding(7)
                .background(Color.blue)
                .clipShape(Capsule())
                
                
            }
            .alert(alertMessage, isPresented: $showingAlert){
                
            }
            .onAppear(){
                if UserDefaults.standard.bool(forKey: kIsLoggedIn){
                    isLoggedIn = true
                }
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
        }
    }
    private func isValidEmailFormat(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    Onboarding()
}
