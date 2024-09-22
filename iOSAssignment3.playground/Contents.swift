import Foundation

// 1. შექმენით მასივი `fruits`, რომელიც შეიცავს 5 ხილის სახელს. გამოიყენეთ `forEach` მეთოდი, რომ დაბეჭდოთ თითოეული ხილის სახელი ცალ-ცალკე ხაზზე.

let fruits = ["Apple", "Cherry", "Banana", "Strawberry", "Peach"]

fruits.forEach { fruit in
        print(fruit)
}

print("\n-----------------\n")
// 2. დაწერეთ ფუნქცია `filterEvenNumbers`, რომელიც იღებს Int-ების მასივს და იყენებს `filter` მეთოდს, რომ დააბრუნოს ახალი მასივი მხოლოდ ლუწი რიცხვებით. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.

func filterEvenNumbers(numbers: [Int]) -> [Int] {
   return numbers.filter {number in
            number % 2 == 0
    }
}

print("Array of even numbers:", filterEvenNumbers(numbers: [3, 5, 6, 8, 7, 66]))
print("Array of even numbers:", filterEvenNumbers(numbers: [34, 25, 68, 816, 71, 66]))

print("\n-----------------\n")
// 3. დაწერეთ ფუნქცია sumOfUniqueSquares, რომელიც იღებს Int-ების მასივს, გადააქცევს მას Set-ად (რომ მოაშოროს დუბლიკატები), შემდეგ იყენებს map მეთოდს ყველა ელემენტის კვადრატში ასაყვანად, და ბოლოს reduce მეთოდს ჯამის გამოსათვლელად. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.

func sumOfUniqueSquares(intArray: [Int]) -> Int {
    let setOfIntArray = Set(intArray)
    
    let result = setOfIntArray.map {$0 * $0}
    
    return result.reduce(into: 0) {$0 += $1}
}

print(sumOfUniqueSquares(intArray: [1, 2, 5, 2, 6, 1, 3]))
print(sumOfUniqueSquares(intArray: [1, 1, 2, 3]))
print(sumOfUniqueSquares(intArray: [1, 1, 2, 10, 10, 3]))

print("\n-----------------\n")
// 4. შექმენით ორი Set fruitsA და fruitsB, რომელებიც შეიცავენ ხილების სახელებს (ზოგიერთი ხილი შეიძლება გვქონდეს ორივე სეტში). გამოიყენეთ Set-ის ოპერაციები (union, intersection, symmetricDifference) და forEach მეთოდი, რომ დაბეჭდოთ: 1) ყველა უნიკალური ხილი ორივე სეტიდან 2) ხილები, რომლებიც ორივე სეტში გვხვდება 3) ხილები, რომლებიც მხოლოდ ერთ სეტშია

var fruitsA: Set<String> = ["Apple", "Cherry", "Banana", "Strawberry", "Peach"]
var fruitsB: Set<String> = ["Apple", "Orange", "Banana", "Kiwi", "Peach"]

// 1. ყველა უნიკალური ხილი ორივე სეტიდან.
print("🟢")
let unicFruitsFromBothSets = fruitsA.symmetricDifference(fruitsB)

unicFruitsFromBothSets.forEach{ print("Unic fruits from both sets:", $0) }
print("🔴")
// 2. ხილები რომლებიც ორივე სეტშია.
print("🟢")
let fruitsInBothSets = fruitsA.intersection(fruitsB)

fruitsInBothSets.forEach { print("Fruits in both sets:", $0) }
print("🔴")
// 3. სეტის უნიკალური ხილები.
print("🟢")
let fruitAUnicFruits = fruitsA.subtracting(fruitsB)

fruitAUnicFruits.forEach{ print("Set A unic fruit:", $0) }
print("🔴")

print("\n-----------------\n")
// 5. შექმენით ორგანზომილებიანი მასივი `matrix`, რომელიც შეიცავს რამდენიმე Int მასივს. გამოიყენეთ `flatMap` მეთოდი, რომ გადააქციოთ ის ერთგანზომილებიან მასივად. დაბეჭდეთ ორიგინალი მატრიცა და მიღებული ბრტყელი მასივი.

var matrix: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(matrix)

let newArray = matrix.flatMap{ $0 }
print(newArray)

print("\n-----------------\n")
// 6. დაწერეთ ფუნქცია `processOptionalNumbers`, რომელიც იღებს `[Int?]` ტიპის მასივს (ოფციონალური Int-ების მასივი). გამოიყენეთ `compactMap`, რომ მიიღოთ ახალი მასივი, სადაც ყველა nil მნიშვნელობა მოშორებულია და დანარჩენი რიცხვები გაორმაგებულია. გამოიძახეთ ფუნქცია და დაბეჭდეთ შედეგი.

func processOptionalNumbers(intArray: [Int?]){
        print(intArray.compactMap{ $0 }.map{ $0 * 2 })
}

let arrayWithNils: [Int?] = [2, nil, 4, 7, nil]
processOptionalNumbers(intArray: arrayWithNils)

print("\n-----------------\n")
var names: [String] = ["Irakli", "Giorgi", "Ana", "Zura"]
var ages: [Int] = [24, 27, 21, 25]

var combinedArrays = Array(zip(names, ages))
let sortedCombinedArrays = combinedArrays.sorted{$0.1 < $1.1}

for (name, age) in sortedCombinedArrays {
    print("\(name): \(age)")
}

// 7. შექმენით ორი სხვადასხვა ტიპის მასივი: `names` (String-ების მასივი) და `ages` (Int-ების მასივი). გამოიყენეთ `zip` ფუნქცია ამ ორი მასივის გასაერთიანებლად, შემდეგ კი `sorted` მეთოდი, რომ დაალაგოთ მიღებული კოლექცია ასაკის მიხედვით. დაბეჭდეთ შედეგი.

//var names: [String] = ["Irakli", "Giorgi", "Ana", "Zura"]
//var ages: [Int] = [24, 27, 21, 25]
//
//func zip(names: [String], ages: [Int]) -> [(name: String, age: Int)] {
//    var zipArray: [(String, Int)] = []
//    // enumerated გვაძლევს მასივს ინდექსით და იმ ინდექსზე მყოფი ელემენტით
//    for (index, name) in names.enumerated() {
//        // დავრწმუნდეთ რომ ასაკის მასივის ელემენტების რაოდენობას არ გავცდეთ მაგ. თუ ასაკის მასივში მხოლოდ 2 ელემენტია ორზე მეტი სახელის ასაკს ვერ გამოვიტანთ.
//        if index < ages.count {
//            zipArray.append((name, ages[index]))
//        }
//    }
//    return zipArray
//    
//}
//
//
//let result = zip(names: names, ages: ages)
//print(result)
//let sortedResult = result.sorted { $0.age < $1.age} // სორტირება ვერ გავაკეთე ფუნქციაში ერორ მიწერდა სორტირებისას ტაიპებზე. რადგან სანამ არ დავაბრუნებ ფუნქციიდან მასივს მანამდე სახელს "name" key  არ აქვს და არც ასაკს რო დავსორტო ამის მიხედვით
//sortedResult.forEach{ print("\($0.name): \($0.age)")}

print("\n-----------------\n")
// 8. დაწერეთ ფუნქცია `groupWordsByLength`, რომელიც იღებს String-ების მასივს და იყენებს `reduce` მეთოდს, რომ დააჯგუფოს სიტყვები მათი სიგრძის მიხედვით Dictionary-ში. გამოიძახეთ ეს ფუნქცია სხვადასხვა სიტყვების მასივზე და დაბეჭდეთ შედეგი. მაგალითად: input: ["apple", "banana", "kiwi", "grape", "strawberry"] output: [4: ["kiwi"], 5: ["apple", "grape"], 6: ["banana"], 10: ["strawberry"]]

func groupWordsByLength(stringArray: [String]) -> [Int: [String]] {
    return stringArray.reduce(into: [:]) { counts, letter in
        let length = letter.count
        counts[length, default: []].append(letter)
    }
}

let groupedResults = groupWordsByLength(stringArray: ["apple", "banana", "kiwi", "grape", "strawberry"])
let sortedGroupedResults = groupedResults.sorted{ $0.0 < $1.0 }

print(sortedGroupedResults)

print("\n-----------------\n")
// 9. შექმენით ფუნქცია processNumbers, რომელიც იღებს Int-ების მასივს და ასრულებს შემდეგ ოპერაციებს: 1) იყენებს filter მეთოდს, რომ დატოვოს მხოლოდ დადებითი რიცხვები 2) იყენებს map მეთოდს, რომ ყველა დარჩენილი რიცხვი აიყვანოს კვადრატში 3) იყენებს sorted მეთოდს, რომ დაალაგოს შედეგი კლებადობით 4) იყენებს prefix მეთოდს, რომ დააბრუნოს პირველი 5 ელემენტი (ან ნაკლები, თუ 5-ზე ნაკლები ელემენტია) მაგალითად: input: [3, -1, 7, 0, 5, -4, 2, 9, 11] output: [121, 81, 49, 25, 9]

func processNumbers(intArray: [Int]) -> [Int] {
    let filteredArray = intArray.filter { number in
        number > 0
    }
    
    let squaredNumberArray = filteredArray.map { $0 * $0 }
    let sortedSquaredNumberArray = squaredNumberArray.sorted(by: >).prefix(5)
    
    return Array(sortedSquaredNumberArray)
}

print(processNumbers(intArray: [3, -1, 7, 0, 5, -4, 2, 9, 11]))

print("\n-----------------\n")
// 10. დაწერეთ ფუნქცია `applyOperations`, რომელიც იღებს Int-ების მასივს და closure-ების მასივს, სადაც თითოეული closure იღებს Int-ს და აბრუნებს Int-ს. ფუნქციამ უნდა გამოიყენოს `map` მეთოდი, რომ ყველა ოპერაცია ჩაატაროს ყველა რიცხვზე და დააბრუნოს შედეგების მასივი. გამოიძახეთ ეს ფუნქცია სხვადასხვა რიცხვებისა და ოპერაციების კომბინაციებით.


func applyOperations(numbers: [Int], operations: [(Int) -> Int]) -> [[Int]] {
    let result = operations.map{action in numbers.map{number in action(number)}}
    return result
}

let sumClosure: (Int) -> Int = { $0 + 5 }
let multiplyClosure: (Int) -> Int = { $0 * 2 }

print(applyOperations(numbers: [2, 4, 5, 6], operations: [sumClosure, multiplyClosure]))
print(applyOperations(numbers: [1, 7, 15, 24], operations: [sumClosure, multiplyClosure]))

print("\n-----------------\n")
// 11. შექმენით ფუნქცია ‘filterAndTransform’, რომელიც იღებს Int-ების მასივს და ასრულებს შემდეგ ოპერაციებს: 1) იყენებს filter მეთოდს, რომ დატოვოს მხოლოდ 10-ზე მეტი რიცხვები 2) იყენებს map მეთოდს, რომ გამოაკლოს 10 ყველა დარჩენილ რიცხვს 3) იყენებს sorted მეთოდს, რომ დაალაგოს შედეგი ზრდადობით.

func filterAndTransform(numbers: [Int]) -> [Int] {
    numbers.filter { $0 > 10 }.map{ $0 - 10}.sorted(by: <)
}

print("Result Array:", filterAndTransform(numbers: [5, 3, 15, 11, 6, 25, 66]))
print("Result Array:", filterAndTransform(numbers: [115, 3, 5, 11, 6, 66]))

print("\n-----------------\n")
// 12. დაწერეთ ფუნქცია `executeInOrder`, რომელიც იღებს ვარიადულ closure პარამეტრს (ყველა closure-ს აქვს ტიპი `() -> Void`). ფუნქციამ უნდა შეასრულოს ეს closure-ები მიმდევრობით, ყოველი შესრულების წინ და შემდეგ კი დაბეჭდოს შესაბამისი შეტყობინება. გამოიძახეთ ეს ფუნქცია რამდენიმე სხვადასხვა ოპერაციით და დააკვირდით შესრულების თანმიმდევრობას.
/*
 მაგალითად:
 executeInOrder(firstOperation, secondOperation, thirdOperation)

 output:
 Executing closure 1...
 First operation is running.
 Finished executing closure 1.

 Executing closure 2...
 Second operation is running.
 Finished executing closure 2.

 Executing closure 3...
 Third operation is running.
 Finished executing closure 3.
 */

func executeInOrder(_ operations: () -> Void... ) {
    for closure in operations {
        closure()
    }
    
}

let firstOperation: () -> Void = {
    print("Executing closure 1...")
    print("1st operation is running")
    print("Finished executing closure 1\n")
}

let secondOperation: () -> Void = {
    print("Executing closure 2...")
    print("2nd operation is running")
    print("Finished executing closure 2\n")
}

let thirdOperation: () -> Void = {
    print("Executing closure 3...")
    print("3rd operation is running")
    print("Finished executing closure 3")
}

executeInOrder(firstOperation, secondOperation, thirdOperation)

