// https://programmers.co.kr/learn/courses/30/lessons/83201
import Foundation

class Student {
    let myScore: Int
    let scores:[Int]
    
    init(_ myScore: Int, scores: [Int]) {
        self.myScore = myScore
        self.scores = scores
    }
    
    func getScore()-> String {
        if (scores.min() == myScore || scores.max() == myScore) , scores.filter({ $0 == myScore }).count == 1 {
            let ss = scores.filter({ $0 != myScore })
            let sum = ss.reduce(0) { $0 + $1 }
            let count = ss.count
            return getGrade(sum/count)
        } else {
            let sum = scores.reduce(0) { $0 + $1 }
            let count = scores.count
            return getGrade(sum/count)
        }
    }
    
    private func getGrade(_ score: Int)-> String {
        if score >= 90 {
            return "A"
        } else if score >= 80 {
            return "B"
        } else if score >= 70 {
            return "C"
        } else if score >= 50 {
            return "D"
        } else {
            return "F"
        }
    }
}

func solution(_ scores:[[Int]]) -> String {
    let count = scores.count
    var students: [Student] = []
    for studentIndex in 0..<count {
        var myScore = 0
        var myScores:[Int] = []
        for scoreIndex in 0..<count {
            let nowScore = scores[scoreIndex][studentIndex]
            myScores.append(nowScore)
            if studentIndex == scoreIndex {
                myScore = nowScore
            }
        }
        students.append(Student(myScore, scores: myScores))
    }
    return students.map{$0.getScore()}.reduce("") { $0 + $1 }
}