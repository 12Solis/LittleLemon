//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 06/11/25.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "First Name"
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? "Last Name"
    let email = UserDefaults.standard.string(forKey: kEmail) ?? "Email"
    
    var body: some View {
        NavigationStack {
            Form{
                Text("Personal information")
                    .font(.system(size: 24, weight: .semibold))
                Section("Avatar"){
                    HStack{
                        /*ProfilePicView()
                            .frame(width: 90)
                            .padding(-15)
                            .shadow(radius: 6)*/
                        Button{
                            
                        }label: {
                            Text("Change")
                                .padding(10)
                            background(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                                
                        }
                        .padding(20)
                            
                    }
                }
                    
            }
            .scrollContentBackground(.hidden)
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
            
            
        }
        /*VStack(spacing:20) {
            Spacer()
            Text("Personal Information")
                .font(.title).bold()
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 300, height: 300)
            
            Text(firstName)
                .font(.title3)
            Text(lastName)
                .font(.title3)
            Text(email)
                .font(.title3)
            
            Spacer()
            
            Button("Logout"){
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
                
            }
            .padding()
        }
        */
    }
}

#Preview {
    UserProfile()
}
