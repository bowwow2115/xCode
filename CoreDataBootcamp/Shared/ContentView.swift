//
//  ContentView.swift
//  Shared
//
//  Created by 박승훈 on 2021/12/07.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  //    @FetchRequest(
  //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
  //        animation: .default)
  //    private var items: FetchedResults<FruitEntity>
  //
  @FetchRequest(entity: FruitEntity.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)])
  var fruits: FetchedResults<FruitEntity>
  
  @State var textFieldText: String = ""
  
  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        
        TextField("Add fruits here...", text: $textFieldText)
          .font(.headline)
          .padding(.leading)
          .frame(maxWidth: .infinity)
          .frame(height: 55)
          .background(.white)
          .padding(.horizontal)
        
        Button(action: {
          addItem()
        }, label: {
          Text("Submit")
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.blue)
            
        })
        List {
          ForEach(fruits) { fruit in
            Text(fruit.name ?? "")
              .onTapGesture {
                updateItem(fruit: fruit)
              }
            //                    NavigationLink {
            //                        Text("Item at \(fruit, formatter: itemFormatter)")
            //                    } label: {
            //                        Text(item.timestamp!, formatter: itemFormatter)
            //                    }
          }
          .onDelete(perform: deleteItems)
        }
        .listStyle(PlainListStyle())
      }
      .navigationTitle("Fruits")
      .navigationBarItems(
        leading: EditButton()
      )
      //            .toolbar {
      //#if os(iOS)
      //                ToolbarItem(placement: .navigationBarTrailing) {
      //                    EditButton()
      //                }
      //#endif
      //                ToolbarItem {
      //                    Button(action: addItem) {
      //                        Label("Add Item", systemImage: "plus")
      //                    }
      //                }
      //            }
      Text("Select an item")
    }
  }
  
  private func addItem() {
    withAnimation {
      let newFruit = FruitEntity(context: viewContext)
      newFruit.name = textFieldText
      //            let newItem = Item(context: viewContext)
      //            newItem.timestamp = Date()
      
      saveItems()
      textFieldText = ""
    }
  }
  
  private func updateItem(fruit: FruitEntity) {
    withAnimation {
      let currentName = fruit.name ?? ""
      let newName = currentName + "!"
      fruit.name = newName
      
      saveItems()
    }
  }
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
//      offsets.map { items[$0] }.forEach(viewContext.delete)
      guard let index = offsets.first else { return }
      let fruitEntity = fruits[index]
      viewContext.delete(fruitEntity)
      
      saveItems()
    }
  }
  
  private func saveItems() {
    do {
      try viewContext.save()
    } catch {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
