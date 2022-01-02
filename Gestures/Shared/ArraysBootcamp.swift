//
//  ArraysBootcamp.swift
//  Gestures
//
//  Created by 박승훈 on 2021/12/06.
//

import SwiftUI
import simd

struct UserModel: Identifiable {
  let id = UUID().uuidString
  let name: String
  let points: Int
  let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
  
  @Published var dataArray: [UserModel] = []
  @Published var filteredArray: [UserModel] = []
  @Published var mappedArray: [String] = []
  
  init() {
    getUsers()
    updateFilteredArray()
  }
  
  func updateFilteredArray() {
    // sort
    //    filteredArray = dataArray.sorted(by: { $0.points > $1.points })
    //    위에거랑 동일
    //    filteredArray = dataArray.sorted { (user1, user2) -> Bool in
    //      return user1.points > user2.points
    //    }
    // filter
    //    filteredArray = dataArray.filter({ $0.isVerified })
    //위에거랑 동일
    //    filteredArray = dataArray.filter({ (user) -> Bool in
    //      return user.points > 5
    //    })
    
    // map
//    mappedArray = dataArray.map({ (user) -> String in
//      return user.name
//    })
//    위에거랑 동일
//    mappedArray = dataArray.map({ $0.name })
    
    mappedArray = dataArray.compactMap({ (user) -> String? in
       return user.name
    })
  }
  func getUsers() {
    let user1 = UserModel(name: "Park1", points: 7, isVerified: true)
    let user2 = UserModel(name: "Park2", points: 9, isVerified: true)
    let user3 = UserModel(name: "Park3", points: 1, isVerified: true)
    let user4 = UserModel(name: "Park4", points: 2, isVerified: true)
    let user5 = UserModel(name: "Park5", points: 1, isVerified: true)
    let user6 = UserModel(name: "Park6", points: 4, isVerified: true)
    let user7 = UserModel(name: "Park7", points: 8, isVerified: true)
    self.dataArray.append(contentsOf: [
      user1,
      user2,
      user3,
      user4,
      user5,
      user6,
      user7
    ])
  }
}

struct ArraysBootcamp: View {
  
  @StateObject var vm = ArrayModificationViewModel()
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        ForEach(vm.mappedArray, id: \.self) { name in
          Text(name)
            .font(.title)
        }
        //        ForEach(vm.filteredArray) { user in
        //          VStack(alignment: .leading) {
        //            Text(user.name)
        //              .font(.headline)
        //            HStack {
        //              Text("Points: \(user.points)")
        //              Spacer()
        //              if user.isVerified {
        //                Image(systemName: "flame.fill")
        //              }
        //            }
        //          }
        //          .foregroundColor(.white)
        //          .padding()
        //          .background(Color.blue.cornerRadius(10))
        //          .padding(.horizontal)
        //        }
      }
    }
  }
}

struct ArraysBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    ArraysBootcamp()
  }
}
