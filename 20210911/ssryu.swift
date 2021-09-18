
import Foundation


//https://programmers.co.kr/learn/courses/30/lessons/42842
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []

    let total = brown + yellow
    
    let divs = getDivs(value: total)
    
    for garo in divs {
        let sero = total / garo
        if garo >= sero, brown == (garo * 2 + sero * 2 - 4) {
            result = [garo, sero]
            break
        }
    }
    
    return result
}

func getDivs(value: Int) -> [Int] {
    var result:[Int] = []
    let limit = value / 2
    for i in 3...limit {
        if value % i == 0 {
            result.append(i)
        }
    }
    return result
}


/// https://programmers.co.kr/learn/courses/30/lessons/42883    10번 시간 초과
func solution(_ number:String, _ k:Int) -> String {
    
    var charList = number.compactMap { $0.wholeNumberValue }
    var removeCount = k
    
    while removeCount > 0 {
        var minIndex = 0
        var preMin = charList[0]
        var isOut = true
        for i in 1..<charList.count {
            let nowValue = charList[i]
            if preMin > nowValue {
                if nowValue == 1 {
                    charList.remove(at: i)
                    removeCount -= 1
                    isOut = false
                    break
                } else {
                    preMin = nowValue
                    minIndex = i
                }
            } else if preMin < nowValue {
                charList.remove(at: minIndex)
                removeCount -= 1
                isOut = false
                break
            }
        }
        if isOut {break}
    }
    
    while removeCount > 0 {
        var preMin = charList[0]
        var minIndex = 0
        for i in 1..<charList.count {
            let nowValue = charList[i]
            if preMin == 1 {
                break
            } else if preMin > nowValue {
                preMin = nowValue
                minIndex = i
            }
        }
        charList.remove(at: minIndex)
        removeCount -= 1
    }
    
    
    let result = charList.reduce("") { result, i in
        return result + String(i)
    }
    return result
}