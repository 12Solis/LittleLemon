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
let kPhoneNumber = "phone number key"



struct Onboarding: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var isLoggedIn = false
    
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack{
                                
                LittleLemonMessageView()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("First name*")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.gray)
                    
                    TextField("Jhon", text: $firstName)
                        .font(Font.system(size: 18, weight: .light))
                        .foregroundStyle(.gray)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(5)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Last name*")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.gray)
                    
                    TextField("Doe", text: $lastName)
                        .font(Font.system(size: 18, weight: .light))
                        .foregroundStyle(.gray)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(5)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email*")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.gray)
                    
                    TextField("jhon.doe@example", text: $email)
                        .font(Font.system(size: 18, weight: .light))
                        .foregroundStyle(.gray)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                }
                .padding(5)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Phone number*")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.gray)
                    
                    TextField("xxx-xx-xxxx", text: $phoneNumber)
                        .font(Font.system(size: 18, weight: .light))
                        .foregroundStyle(.gray)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                .padding(5)
                
                Button("Register"){
                    if !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty {
                        if isValidEmailFormat(email: email) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            
                            isLoggedIn = true
                            
                        }else{
                            print( "Invalid Email Format")
                            alertMessage = "Invalid Email Format"
                            showingAlert = true
                            
                        }
                        
                    } else{
                        alertMessage = "Please fill all the fields"
                        showingAlert = true
                    }
                    
                    
                }
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.blue)
                .clipShape(Capsule())
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("LittleLemonLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 60)
                }
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
