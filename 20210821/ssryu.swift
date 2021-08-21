

/// https://www.acmicpc.net/problem/14719
import Foundation
func solution(_ size: [Int], _ arr: [Int]) {
    var result = 0
    let H = size[0]
    let W = size[1]
    for height in 1...H {
        var isWater = false
        var waterCount = 0
        for width in 1...W {
            let wall = arr[width-1]
            if wall >= height {
                isWater = true
                if waterCount > 0 {
                    result += waterCount
                    waterCount = 0
                }
            } else if isWater {
                waterCount += 1
            }
        }
    }
    print(result)
}

var readSize = readLine()
var readArr = readLine()

if let readSize = readSize, let readArr = readArr {
    let sizes = readSize.components(separatedBy: " ").map{ Int($0)! }
    let arr = readArr.components(separatedBy: " ").map{ Int($0)! }
    solution(sizes,arr)
}


/// https://programmers.co.kr/learn/courses/30/lessons/42586
class Worker{
    let MAX = 100
    var progress: Int
    var speed: Int
    
    init(_ progress: Int, _ speed: Int) {
        self.progress = progress
        self.speed = speed
    }
    
    func work() {
        progress = progress + speed
        if (MAX <= progress) {
            progress = MAX
        }
    }
    
    func isComplete() -> Bool {
        return progress >= MAX
    }
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer: [Int] = []
    var workers: [Worker] = []
    
    for i in 0..<progresses.endIndex {
        workers.append(Worker(progresses[i], speeds[i]))
    }
    
    while workers.count != 0 {
        var releaseCount = 0
        workers.forEach { $0.work() }
        for i in 0..<workers.endIndex {
            if workers[i].isComplete() {
                releaseCount += 1
                if i == workers.endIndex - 1 {
                    answer.append(releaseCount)
                    workers.removeSubrange(0..<releaseCount)
                }
                
            } else {
                if releaseCount > 0 {
                    answer.append(releaseCount)
                    workers.removeSubrange(0..<releaseCount)
                }
                break
            }
        }
    }
    return answer
}