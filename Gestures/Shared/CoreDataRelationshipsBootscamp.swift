//
//  CoreDataRealationshipsBootscamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/08.
//

import SwiftUI
import CoreData

//3 entities
//BuisnessEntity
//DepartmentEntity
//EmployeeEntity

class CoreDataManager {
  
  static let instance = CoreDataManager()
  let container: NSPersistentContainer
  let context: NSManagedObjectContext
  
  init() {
    container = NSPersistentContainer(name: "CoreDataContainer")
    container.loadPersistentStores { (description, error) in
      if let error = error {
        print("Error loading Core Data. \(error)")
      }
    }
    context = container.viewContext
  }
  
  func save() {
    do{
      try context.save()
      print("Saved Successfully")
    } catch let error {
      print("Error saving. \(error.localizedDescription)")
    }
  }
}

class CoreDataRelationshipViewModel: ObservableObject {
  
  let manager = CoreDataManager.instance
  @Published var businesses: [BusinessEntity] = []
  @Published var departments: [DepartmentEntity] = []
  @Published var employees: [EmployeeEntity] = []
  
  init() {
    getBusinesses()
    getDepartment()
    getEmployees()
  }
  
  func getBusinesses() {
    let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
    
    let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
    request.sortDescriptors = [sort]
    
    let filter = NSPredicate(format: "name==%@", "Apple")
    request.predicate = filter
     
    do {
      businesses = try manager.context.fetch(request)
    } catch let error {
      print("Error fetching. \(error.localizedDescription)")
    }
  }
  
  func getDepartment() {
    let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
    
    do {
      departments = try manager.context.fetch(request)
    } catch let error {
      print("Error fetching. \(error.localizedDescription)")
    }
  }
  
  func getEmployees() {
    let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
    
    do {
      employees = try manager.context.fetch(request)
    } catch let error {
      print("Error fetching. \(error.localizedDescription)")
    }
  }
  
  func addBusiness() {
    let newBusiness = BusinessEntity(context: manager.context)
    newBusiness.name = "Apple"
    
    // add existing departments to the new business
    // newBusiness.departments = []
    
    // add existing employees to the new business
    // newBusiness.employees = []
    
    // add new business to existing department
//    newBusiness.addToDeparments(<#T##value: DepartmentEntity##DepartmentEntity#>)
    save()
  }
  
  func addDepartment() {
    let newDepartment = DepartmentEntity(context: manager.context)
    newDepartment.name = "Marketing"
    newDepartment.businesses = [businesses[0]]
    save()
  }
  
  func addEmployee() {
    let newEmployee = EmployeeEntity(context: manager.context)
    newEmployee.age = 33
    newEmployee.dataJoined = Date()
    newEmployee.name = "Emily"
    
//    newEmployee.buisness = businesses[10]
//    newEmployee.department = departments[10]
    save()
  }
  
  func save() {
    businesses.removeAll()
    departments.removeAll()
    employees.removeAll()
    
    self.manager.save()
    self.getBusinesses()
    self.getDepartment()
    self.getEmployees()
  }
}

struct CoreDataRelationshipsBootscamp: View {
  
  @StateObject var vm = CoreDataRelationshipViewModel()
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(spacing: 20) {
          Button(action: {
            vm.addEmployee()
          }, label: {
            Text("Perform Action")
              .foregroundColor(.white)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(Color.blue.cornerRadius(10))
          })
          
          ScrollView(.horizontal, showsIndicators: true, content: {
            HStack(alignment: .top) {
              ForEach(vm.businesses) { business in
                BusinessView(entity: business)
              }
            }
          })
          
          ScrollView(.horizontal, showsIndicators: true, content: {
            HStack(alignment: .top) {
              ForEach(vm.departments) { department in
                DepartmentView(entity: department)
              }
            }
          })
          
          ScrollView(.horizontal, showsIndicators: true, content: {
            HStack(alignment: .top) {
              ForEach(vm.employees) { employee in
                EmployeeView(entity: employee)
              }
            }
          })
        }
        .padding(.horizontal)
      }
      .navigationTitle("Relationships")
    }
    
  }
}

struct CoreDataRelationshipsBootscamp_Previews: PreviewProvider {
  static var previews: some View {
    CoreDataRelationshipsBootscamp()
  }
}

struct BusinessView: View {
  
  let entity: BusinessEntity
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20, content: {
      Text("Name: \(entity.name ?? "")")
        .bold()
      
      if let departments = entity.deparments?.allObjects as? [DepartmentEntity] {
        Text("Departments: ")
          .bold()
        ForEach(departments) { department in
          Text(department.name ?? "")
        }
      }
      if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
        Text("Employees")
          .bold()
        ForEach(employees) { employee in
          Text(employee.name ?? "")
        }
      }
    })
      .padding()
      .frame(maxWidth: 300, alignment: .leading)
      .background(Color.gray.opacity(0.5))
      .cornerRadius(10)
      .shadow(radius: 10)
  }
}

struct DepartmentView: View {

  let entity: DepartmentEntity

  var body: some View {
    VStack(alignment: .leading, spacing: 20, content: {
      Text("Name: \(entity.name ?? "")")
        .bold()

      if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
        Text("Businesses: ")
          .bold()
        ForEach(businesses) { business in
          Text(business.name ?? "")
        }
      }
      if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
        Text("Employees")
          .bold()
        ForEach(employees) { employee in
          Text(employee.name ?? "")
        }
      }
    })
      .padding()
      .frame(maxWidth: 300, alignment: .leading)
      .background(Color.green.opacity(0.5))
      .cornerRadius(10)
      .shadow(radius: 10)
  }
}

struct EmployeeView: View {

  let entity: EmployeeEntity

  var body: some View {
    VStack(alignment: .leading, spacing: 20, content: {
      Text("Name: \(entity.name ?? "")")
        .bold()
      
      Text("Business:")
        .bold()
      
      Text(entity.buisness?.name ?? "")
      
      Text("Department: ")
        .bold()
      
      Text(entity.department?.name ?? "")
    })
      .padding()
      .frame(maxWidth: 300, alignment: .leading)
      .background(Color.blue.opacity(0.5))
      .cornerRadius(10)
      .shadow(radius: 10)
  }
}

