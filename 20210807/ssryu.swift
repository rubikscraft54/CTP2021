
//https://programmers.co.kr/learn/courses/30/lessons/82612 문제
func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    
    // var totalPrice = 0
    // for i in 1...count {
    //     totalPrice += price * i
    // }
    // 위에 토탈 price랑 구하는 방식이 같음
    // let totalPrice = (1...count).reduce(0) { $0 + ($1 * price)}
    let totalPrice = (1...count).map{$0 * price}.reduce(0, +)

    answer = Int64(totalPrice - money)
    if answer < 0 {
        answer = 0
    }
    return answer
}


