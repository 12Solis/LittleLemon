//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 06/11/25.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
   /*/ let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "First Name"
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? "Last Name"
    let email = UserDefaults.standard.string(forKey: kEmail) ?? "Email"
    let phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? "Phone Number"
    */
    @AppStorage(kFirstName) var firstName: String = "First Name"
    @AppStorage(kLastName) var lastName: String = "Last Name"
    @AppStorage(kEmail) var email: String = "Email"
    @AppStorage(kPhoneNumber) var phoneNumber: String = "Phone Number"
    
    @State private var editFirstName = ""
    @State private var editLastName = ""
    @State private var editEmail = ""
    @State private var editPhoneNumber = ""
    
    @State private var didLogout = false
    @State private var isAlertPresented = false
    @State private var alertTitle = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Personal information")
                        .font(.system(size: 24, weight: .semibold))
                   
//MARK: Profile avatar
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Avatar")
                            .font(.subheadline)
                        
                        HStack {
                            ProfilePicView()
                                .frame(width: 90)
                                .padding()
                                .shadow(radius: 6)
                                .padding(-15)
                            
                            ProfileViewButton(title: "Change")
                                .padding(5)
                            
                            ProfileViewButton(title: "Remove")
                                .padding(5)
                        }
                    }
                    .padding()
                  
//MARK: Info form
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("First name")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.gray)
                        
                        TextField(firstName, text: $editFirstName)
                            .font(Font.system(size: 18, weight: .light))
                            .foregroundStyle(.gray)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Last name")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.gray)
                        
                        TextField(lastName, text: $editLastName)
                            .font(Font.system(size: 18, weight: .light))
                            .foregroundStyle(.gray)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Email")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.gray)
                        
                        TextField(email, text: $editEmail)
                            .font(Font.system(size: 18, weight: .light))
                            .foregroundStyle(.gray)
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Phone number")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(.gray)
                        
                        TextField(phoneNumber, text: $editPhoneNumber)
                            .font(Font.system(size: 18, weight: .light))
                            .foregroundStyle(.gray)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                    }
                    .padding()
                    

//MARK: Notifications
                    
                    Text("Email notifications")
                        .font(.system(size: 19, weight: .semibold))
                        .padding(.vertical,20)
                    HStack{
                        CheckboxButtonView()
                        Text("Order statuses")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                    .padding(.vertical)
                    HStack{
                        CheckboxButtonView()
                        Text("Password changes")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                    .padding(.vertical)
                    HStack{
                        CheckboxButtonView()
                        Text("Special offers")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                    .padding(.vertical)
                    HStack{
                        CheckboxButtonView()
                        Text("Newsletter")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                    .padding(.vertical)
                    
//MARK: Changes buttons
                    
                    Button{
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        didLogout = true
                    }label: {
                        HStack {
                            Spacer()
                            Text("Logout")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(.principalLittleLemon)
                                .padding()
                            Spacer()
                        }
                        .background(
                            RoundedRectangle(cornerRadius:8)
                                .fill(.accentLittleLemon)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.orange, lineWidth: 1.5)
                                )
                            
                        )
                    }
                    .padding(.vertical)
                    
                    HStack{
                        Spacer()
                        Button{
                           discardChanges()
                            alertTitle = "Changes discarded"
                            isAlertPresented = true
                        }label:{
                            Text("Discard changes")
                                .bold()
                                .foregroundStyle(.gray)
                                .padding(.horizontal,20)
                                .padding(.vertical,15)
                                .background(
                                    RoundedRectangle(cornerRadius:8)
                                        .fill( .clear)
                                        .overlay(
                                            RoundedRectangle(cornerRadius:8)
                                                .stroke(Color.principalLittleLemon, lineWidth: 1.5)
                                        )
                                )
                        }
                        
                        Spacer()
                        
                        Button{
                            saveChanges()
                            alertTitle = "Changes saved!"
                            isAlertPresented = true
                            
                        }label:{
                            Text("Save changes")
                                .bold()
                                .foregroundStyle(.text)
                                .padding(.horizontal,20)
                                .padding(.vertical,15)
                                .background(
                                    RoundedRectangle(cornerRadius:8)
                                        .fill( .principalLittleLemon)
                                        .overlay(
                                            RoundedRectangle(cornerRadius:8)
                                                .stroke(Color.principalLittleLemon, lineWidth: 1.5)
                                        )
                                )
                        }
                        Spacer()
                    }


                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .alert(alertTitle, isPresented: $isAlertPresented){}
                
            .toolbar{
                ToolbarItem(placement: .principal){
                    Image("LittleLemonLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 60)
                }
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(destination: UserProfile()) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                }
            }
            .navigationDestination(isPresented: $didLogout) {
                Onboarding()
            }
            
            
        }
        .onAppear(){
            initializeUserProfile()
        }

    }
    func initializeUserProfile(){
        self.editFirstName = firstName
        self.editLastName = lastName
        self.editEmail = email
        self.editPhoneNumber = phoneNumber
    }
    func saveChanges() {
        self.firstName = editFirstName
        self.lastName = editLastName
        self.email = editEmail
        self.phoneNumber = editPhoneNumber
            
        UserDefaults.standard.synchronize()
    }
    func discardChanges() {
        editFirstName = firstName
        editLastName = lastName
        editEmail = email
        editPhoneNumber = phoneNumber
    }
    
}

#Preview {
    UserProfile()
}
