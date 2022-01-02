import SwiftUI

//func hello(one: Int, two: @escaping(_ inone: Int, _ intwo: Int) -> (Int)) {
//  print(one + two(one))
//}
//
//hello(one: 1) { one, two in
//  return one + two
//
//}

var num = 2

func noEscaping(escapingTest: @escaping(_ num1: Int) -> ()) {
  print("from noEscaping: \(num)")
  escapingTest(2)
}

noEscaping { num1 in
  print(num1)
  num += num1
  print("from escapingTest: \(num)")
  
}
print(num)
