//
//  main.swift
//  CLI-Hackerrank
//
//  Created by Tom Seymour on 4/20/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import Foundation


func solveMeFirst() {
    // read integers line by line
    var a = Int(readLine()!)!
    var b = Int(readLine()!)!
    
    // Hint: Type print(a + b) below
    
    print(a + b)
}



/*
https://www.hackerrank.com/challenges/simple-array-sum
 Sample Input
 
 6
 1 2 3 4 10 11
 Sample Output
 
 31
 */

func simpleArraySum() {
    // number of elements
    let n = Int(readLine()!)!
    
    // read array and map the elements to integer
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

// find and print the sum of array
    
    print(arr.reduce(0, +))
    
}


/*
 https://www.hackerrank.com/challenges/compare-the-triplets
 Sample Input
 
 5 6 7
 3 6 10
 Sample Output
 
 1 1
 */

func compareTheTriplets() {
    let arrA = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let arrB = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    var a = 0
    var b = 0
    for i in 0..<arrA.count {
        a += arrA[i] > arrB[i] ? 1 : 0
        b += arrB[i] > arrA[i] ? 1 : 0
    }
    print(a, b)
}


/*
 https://www.hackerrank.com/challenges/a-very-big-sum?h_r=next-challenge&h_v=zen
 Sample Input
 
 5
 1000000001 1000000002 1000000003 1000000004 1000000005
 Output
 
 5000000015
 */

func aVeryBigSum() {
    // number of elements
    let n = Int(readLine()!)!
    
    // read array and map the elements to integer
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    print(arr.reduce(0, +))
}


/*
 https://www.hackerrank.com/challenges/diagonal-difference?h_r=next-challenge&h_v=zen
 Sample Input
 
 3
 11 2 4
 4 5 6
 10 8 -12
 Sample Output
 
 15
 */

func diagonalDifference() {
    // read the integer n
    let n = Int(readLine()!)!
    
    // declare 2d array
    var arr: [[Int]] = []
    
    // read array row-by-row
    for _ in 0..<n {
        arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
    }
    var d1 = 0
    var d2 = 0
    for i in 0..<arr.count {
        d1 += arr[i][i]
        d2 += arr[i][arr.count - 1 - i]
    }
    print(abs(d1 - d2))
}


/*
 https://www.hackerrank.com/challenges/maximum-element?h_r=internal-search
 Sample Input
 
 10
 1 97
 2
 1 20
 2
 1 26
 1 20
 2
 3
 1 91
 3
 
 Sample Output
 
 26
 91
 */

func maximumElement() {
    
    let n = Int(readLine()!)!
    
    var stack: [Int] = []
    var maxElements: [Int] = [0]
    
    for _ in 0..<n {
        let thisInput = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        let command = thisInput[0]
        
        switch command {
        case 1:
            let newStackElement = thisInput[1]
            stack.append(newStackElement)
            if newStackElement >= maxElements.last! {
                maxElements.append(newStackElement)
            }
        case 2:
            if let pop = stack.popLast(), pop == maxElements.last! {
                _ = maxElements.popLast()
            }
        case 3:
            print(maxElements.last!)
        default:
            break
        
        }
    }
}


/*
 https://www.hackerrank.com/challenges/balanced-brackets?h_r=next-challenge&h_v=zen
 Sample Input
 
 3
 {[()]}
 {[(])}
 {{[[(())]]}}
 Sample Output
 
 YES
 NO
 YES
 
 */

func balancedBrackets() {
    let n = Int(readLine()!)!
    func isValid(_ s: String) -> Bool {
        let openToClose: [Character: Character] = ["(" : ")", "[" : "]", "{": "}"]
        let closeToOpen: [Character: Character] = [")" : "(", "]" : "[", "}": "{"]
        
        var openBrackets: [Character] = []
        var closeBrackets: [Character] = []
        
        for bracket in s.characters {
            if openToClose.keys.contains(bracket) {
                openBrackets.append(bracket)
            } else {
                closeBrackets.append(bracket)
                if openBrackets.isEmpty {
                    return false
                }
                if closeToOpen[bracket]! == openBrackets.last! {
                    _ = openBrackets.popLast()
                    _ = closeBrackets.popLast()
                }
            }
        }
        return openBrackets.isEmpty && closeBrackets.isEmpty
    }
    for _ in 0..<n {
        print( isValid(readLine()!) ? "YES" : "NO" )
    }
    
}


/*
 https://www.hackerrank.com/challenges/equal-stacks?h_r=next-challenge&h_v=zen
 
 Sample Input
 
 5 3 4
 3 2 1 1 1
 4 3 2
 1 1 4 1
 Sample Output
 
 5
 */

func equalStacks() {
    
    _ = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    var one: (stack: [Int], height: Int) = (readLine()!.components(separatedBy: " ").map{ Int($0)! }.reversed(), 0)
    var two: (stack: [Int], height: Int) = (readLine()!.components(separatedBy: " ").map{ Int($0)! }.reversed(), 0)
    var three: (stack: [Int], height: Int) = (readLine()!.components(separatedBy: " ").map{ Int($0)! }.reversed(), 0)
    
    one.height = one.stack.reduce(0, +)
    two.height = two.stack.reduce(0, +)
    three.height = three.stack.reduce(0, +)
    
    while !(one.height == two.height && two.height == three.height) {
        if one.height >= two.height && one.height >= three.height {
            one.height -= one.stack.popLast()!
        } else if two.height >= one.height && two.height >= three.height {
            two.height -= two.stack.popLast()!
        } else if three.height >= one.height && three.height >= two.height {
            three.height -= three.stack.popLast()!
        }
    }
    print(one.height)
}


// MARK: - THIS IS WHERE WE RUN

print("enter the inputs")
//compareTheTriplets()
//aVeryBigSum()
//diagonalDifference()
//maximumElement()
//balancedBrackets()
equalStacks()











