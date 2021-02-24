//
//  TestFile.swift
//  TestDrivenDevelopment
//
//  Created by Rahala, Jasamrit (Coll) on 28/01/2021.
//

import Foundation

class Helper{
    
    class func isIntArray<T>(_ input: T) -> Bool{
        return input is [Int]
    }
    
    class func isInt<T>(_ input: T) -> Bool{
        return input is Int
    }
    
    class func getInt<T>(_ input: T) -> Int{
        return input as Any as! Int
    }
    
    class func getIntArray<T>(_ input: T) -> [Int]{
        return input as Any as! [Int]
    }
    
}

class Search{
    
    enum ArgumentError: Error{
        case nonIntegerSearchArray
        case nonIntegerSearchTarget
        case nonSortedSearchArray
    }
    
    func linearSearch<T, U>(intArray: T, target: U) throws -> Int{
        
        if !Helper.isInt(target){ throw Search.ArgumentError.nonIntegerSearchTarget }
        if !Helper.isIntArray(intArray){ throw Search.ArgumentError.nonIntegerSearchArray }
        
        let intArray = Helper.getIntArray(intArray)
        let target = Helper.getInt(target)
        
        for index in 0 ..< intArray.count{ if intArray[index] == target{ return index } }
        return -1
    }
    
    func binarySearch<T, U>(intArray: T, target: U) throws -> Int{
        
        
        if !Helper.isInt(target){ throw Search.ArgumentError.nonIntegerSearchTarget }
        if !Helper.isIntArray(intArray){ throw Search.ArgumentError.nonIntegerSearchArray }
        
        let intArray = Helper.getIntArray(intArray)
        let target = Helper.getInt(target)
        
        var index = 0
        while index < intArray.count - 1{
            if intArray[index] > intArray[index + 1] { throw Search.ArgumentError.nonSortedSearchArray }
            index += 1
        }
        
        var left = 0
        var right = intArray.count - 1
        
        while left <= right{
            let middle = (left + right) / 2
            if intArray[middle] == target{ return middle }
            else if intArray[middle] > target{ right = middle - 1}
            else { left = middle + 1}
        }
        return -1
        
    }

}


class Sort{
    
    func mergeSort(intArray: [Int]) -> [Int]{
        
        if intArray.count <= 1 { return intArray }
        
        let left_half = mergeSort(intArray: Array(intArray[0..<Int(intArray.count/2)]))
        let right_half = mergeSort(intArray: Array(intArray[Int(intArray.count/2)..<intArray.count]))

        var i = 0
        var j = 0

        var final_array = [Int]()
        while i != left_half.count && j != right_half.count{
            if left_half[i] < right_half[j]{
                final_array.append(left_half[i])
                i += 1
            }
            else{
                final_array.append(right_half[j])
                j += 1
            }
        }

        for x in i..<left_half.count{
            final_array.append(left_half[x])
            
        }
        
        for x in j..<right_half.count{
            final_array.append(right_half[x])
        }
        return final_array
        
    }
    
    func bubbleSort(intArray: inout [Int]) -> [Int]{
        
        var swaps = false
        
        for i in 0..<intArray.count{
            for j in i..<intArray.count{
                if (intArray[i] > intArray[j]){
                    swaps = true
                    
                    let temp = intArray[i]
                    intArray[i] = intArray[j]
                    intArray[j] = temp
                }
            }
            if (swaps == false){
                return intArray
            }
        }
        return intArray
        
    }
    
    func quickSort(intArray: inout[Int]) -> [Int]{
        
        if intArray.count <= 1{
            return intArray
        }
        
        let pivot = intArray.remove(at: 0)
        
        var lower = [Int]()
        var upper = [Int]()
        
        for item in intArray{
            if item < pivot{
                lower.append(item)
            }
            else{
                upper.append(item)
            }
        }
        
        var result = [Int]()
        for number in quickSort(intArray: &lower){
            result.append(number)
        }
        result.append(pivot)
        for number in quickSort(intArray: &upper){
            result.append(number)
        }
        return result

    }
        
    
    func insertionSort(intArray: inout [Int]) -> [Int]{
        
        for i in 1..<intArray.count{
            let value = intArray[i]
            var position = i
            
            while position != 0 && intArray[position - 1] > value{
                intArray[position] = intArray[position - 1]
                position -= 1
            }
            intArray[position] = value
        }
        
        return intArray
        
    }

}
