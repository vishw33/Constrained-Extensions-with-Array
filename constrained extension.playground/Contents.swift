//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

//: ## Array with Numeric Values

extension Array where Element : Numeric
{
    func sum() -> Element
    {
        if self.count == 0
        {
            return 0
        }
        return reduce(0, +)
    }
    
    func string() -> [String]
    {
        return compactMap{String(describing: $0)}
    }
}

//: ## Array with String Values
extension Array where Element == String
{
    func totalCharacterCount() -> Int
    {
        return reduce(0, { $0 + $1.count})
    }
    
    func wordCount() -> Int
    {
        return reduce(0, {$0 + $1.components(separatedBy: " ").count})
    }
    
    func elementCharacterCount() -> [Int]
    {
        var countArray:[Int] = [Int]()
        countArray =  map{$0.count}
        return countArray
    }
}

//: ## Array with Userdefined Values
extension Array where Element == Person
{
     func arrangePersonsByAge() -> [Element]
    {
        var arr = self
        arr.sort { (a, b) -> Bool in
            
            a.age > b.age
        }
        return arr
    }
    
    func arrangePersonsBySalary() -> [Element]
    {
        var arr = self
        arr.sort { (a, b) -> Bool in
            a.salary < b.salary
        }
        return arr
    }
}

//: ## Just another Example
extension Array where Element == Character
{
    func characterCount() -> Dictionary<Character,Int>
    {
        var dict = Dictionary<Character,Int>()
        self.forEach { (chr) in
            
            if ((dict.index(forKey: chr)) == nil)
            {
                dict[chr] = 1
            }
            else
            {
                if let inr:Int = dict[chr]
                {
                    dict[chr] = inr + 1
                }
            }
        }
        return dict
    }
}


struct Person
{
    var name:String
    var age:Int
    var salary:Double
}

let person1 = Person(name:"jhon" , age:40, salary: 932)
let person2 = Person(name:"david" , age:45, salary: 1876)
let person3 = Person(name:"jim" , age:30, salary: 1763)
let person4 = Person(name:"tom" , age:28, salary: 1527)
let person5 = Person(name:"harry" , age:50, salary: 13344)

var personArray:[Person] = [person1,person2,person3,person4,person5]
personArray.map{print("Person-Age :- \($0.age)")}

let reArrangedPersonByAge = personArray.arrangePersonsByAge()
reArrangedPersonByAge.map{print("Person-Rearranged-Age :- \($0.age)")}

let reArrangedPersonBySalary = personArray.arrangePersonsBySalary()
reArrangedPersonBySalary.map{ print("Person-Rearranged-Salary :- \($0.salary)") }


let reArrangedPersonByAge_Salary = personArray.arrangePersonsByAge().arrangePersonsBySalary()
reArrangedPersonByAge_Salary.map{ print("Person-Rearranged-Age&Salary :- \($0.age ,$0.salary)") }

let reArrangedPersonBySalary_Age = personArray.arrangePersonsBySalary().arrangePersonsByAge()
reArrangedPersonBySalary_Age.map{ print("Person-Rearranged-Salary&Age :- \($0.salary ,$0.age)") }


personArray.map{print("Person-Post :- \($0.age)")}



let numArray = [1,2,3,4,5,6]
print("numArrayType = \(type(of: numArray))")
let sumValue = numArray.sum()
let convertedStringArray = numArray.string()
print("val = \(sumValue)")
print("convertedStringArray = \(convertedStringArray)")
print("convertedStringArrayType = \(type(of: convertedStringArray))")


let arrayString:[String] = ["The Godfather", "The Shawshank Redemption" , "Schindler's List" , "Raging Bull" , "Gone with the Wind" , "The Wizard of Oz" , "Lawrence of Arabia" , "Forrest Gump"]
let characterCount = arrayString.totalCharacterCount()
let wordCount = arrayString.wordCount()
let eachCharacterCount = arrayString.elementCharacterCount()
print("characterCount = \(characterCount)")
print("wordCount = \(wordCount)")
print("eachCharacterCount = \(eachCharacterCount)")


let randomNumbers:[Int] = [1 ,3,45,6743,4673,435,4162,6657,2431,658,686,56,3456,8875,325,46,2,66537,6,0]
let greaterThanArray = randomNumbers.sorted(by: >)
let lesserThanArray = randomNumbers.sorted(by: <)
print(greaterThanArray)
print(lesserThanArray)

let stringArray = ["Vishwas" ,"Palindrome" , "Rat"]
let char:[Character] = stringArray.flatMap{Array($0)}
let repeatDict = char.characterCount()
print(repeatDict)

