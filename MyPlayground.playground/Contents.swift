import UIKit


func filterFunc(value: Int, nums: [Int]) -> [Int] {
    var filterSet = [Int]()
    print(type(of: filterSet))
    for num in nums {
        if num > value {
            filterSet.append(num)
        }
    }
    return filterSet
}

let filterdList = filterFunc(value: 3, nums: [1,2,4,6,8])
print(filterdList)

func sayHello(to name: String) {
    print("Hello \(name)")
}
sayHello(to: "Cat")

let sayHelloClosure: (String) -> () = { name in
    print("hello \(name)")
}

sayHelloClosure("cat with closures")

func sum(a: Int, b: Int) -> Int {
    a + b
}

let answer = sum(a: 3, b: 6)
print(answer)

let addSumClosure: (Int, Int) -> Int = {a, b in
    a + b
}

print(addSumClosure(9,1))

func closuresWithFuncParams(to name: String, closureCall: (String) -> ()) {
    let newName = name.uppercased()
    closureCall(newName)
}

let innerCall: (String) -> () = { name in
    print("hello \(name)")
}

innerCall("Dusty")

closuresWithFuncParams(to: "Cat", closureCall: innerCall)

func code(for title: String, sampleCode: () -> Void) {
    sampleCode()
}

code(for: "Sample") {
    print("sample code")
}


