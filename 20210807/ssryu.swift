
//https://programmers.co.kr/learn/courses/30/lessons/82612 문제

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    
    var totalPrice = 0
    for i in 1...count {
        totalPrice += price * i
    }
    answer = Int64(totalPrice - money)
    if answer < 0 {
        answer = 0
    }
    return answer
}