//
//  CoreDataBootcamp2.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/08.
//

import SwiftUI
import CoreData

// View - UI
// Model - data point
// ViewModel - manages the data for a view

class CoreDataViewModel: ObservableObject {
  
  let container: NSPersistentContainer
  @Published var savedEntities: [FruitEntity] = []
  
  init() {
    container = NSPersistentContainer(name: "FruitsContainer")
    container.loadPersistentStores { (description, error) in
      if let error = error {
        print("ERROR LOADING CORE DATA. \(error)")
      } else {
        print("Succesfully load core data")
      }
    }
    fetchFruits()
  }
  
  func fetchFruits() {
    let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
    
    do {
     savedEntities = try container.viewContext.fetch(request)
    } catch let error {
      print("Error fetching. \(error)")
    }
  }
  
  func addFruit(text: String) {
    let newFruit = FruitEntity(context: container.viewContext)
    newFruit.name = text
    saveData()
  }
  
  func updateFruit(entity: FruitEntity) {
    let currentName = entity.name ?? ""
    let newName  = currentName + "!"
    entity.name = newName
    saveData()
  }
  
  func deleteFruit(indexSet: IndexSet) {
    guard let index = indexSet.first else { return }
    let entity = savedEntities[index]
    container.viewContext.delete(entity)
    saveData()
  }
  
  func saveData() {
    do {
      try container.viewContext.save()
      fetchFruits()
    } catch let error {
      print("Error saving. \(error)")
    }
  }
  
}

struct CoreDataBootcamp2: View {
  
  @StateObject var vm = CoreDataViewModel()
  @State var textFieldText: String = ""
  
    var body: some View {
      NavigationView {
        VStack(spacing: 20) {
          TextField("Add fruit here..." , text: $textFieldText)
            .font(.headline)
            .padding(.leading)
            .frame(height: 55)
            .background(Color(.systemGray4))
            .cornerRadius(10)
          
          Button(action: {
            guard !textFieldText.isEmpty else { return }
            vm.addFruit(text: textFieldText)
          }, label: {
            Text("Save")
              .font(.headline)
              .foregroundColor(.white)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(.blue)
              .cornerRadius(10)
          })
          
          List {
            ForEach(vm.savedEntities) { entity in
              Text(entity.name ?? "NO NAME")
                .onTapGesture { () -> Void in
                  vm.updateFruit(entity: entity)
                }
            }
            .onDelete(perform: vm.deleteFruit)
          }
          .listStyle(PlainListStyle())
        }
        .navigationTitle("Fruits")
        .padding(.horizontal)
      }
    }
  

}

struct CoreDataBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp2()
    }
}
