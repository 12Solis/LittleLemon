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
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("Little Lemon")
                .font(.title).fontWeight(.bold)
                .padding(.horizontal)
            Text("Chicago")
                .padding(.horizontal)
                .font(.title2).fontWeight(.semibold)
            Text("The Little Lemon Foor Ordering App!")
                .padding(.horizontal)
            
            FetchedObjects(predicate: NSPredicate(value: true)) { (dishes: [Dish]) in
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
                    }
                }
            }
        }
        .onAppear(){
            getMenuData()
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
                        
                        // Guardamos los cambios en Core Data
                        try? viewContext.save()
                    }
                }
            }
        }
        task.resume()
    }
}


#Preview {
    Menu()
}
