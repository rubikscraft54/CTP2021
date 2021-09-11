
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
    for i in 3..<value {
        if value % i == 0 {
            result.append(i)
        }
    }
    return result
}


///