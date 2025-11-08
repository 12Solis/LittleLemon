//
//  Menu.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 06/11/25.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchText = ""
    @State private var isSearchActive = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                
                
                LittleLemonMessageView(isSearching:$isSearchActive)
                
                
                TextField("Search menu", text: $searchText)
                
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptor()
                ) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            HStack {
                                Text("\(dish.title ?? "Unknown") - $\(dish.price ?? "")")
                                    .font(.body)
                                    .lineLimit(1)
                                    .padding(.trailing, 8)
                                
                                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            .padding(.vertical, 4)
                            Divider()
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .onAppear(){
                getMenuData()
            }
            .navigationBarTitleDisplayMode(.inline)
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
    }
    
    
    func getMenuData(){
        PersistenceController.shared.clear()
        
        let serverUrl = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: serverUrl)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode(MenuList.self, from: data) {
                    
                    let menuItems = decodedData.menu
                    
                    
                    DispatchQueue.main.async {
                        
                        for item in menuItems {
                            let dish = Dish(context: viewContext)
                            dish.title = item.title
                            dish.image = item.image
                            dish.price = item.price
                        }
                        
                        try? viewContext.save()
                    }
                }
            }
        }
        task.resume()
    }
    
    func buildSortDescriptor() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title", ascending: true,selector: #selector(NSString.localizedStandardCompare))
            
        ]
            
        
    }
    func buildPredicate() -> NSPredicate {
        
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }
        else{
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
    }
}


#Preview {
    Menu()
}
