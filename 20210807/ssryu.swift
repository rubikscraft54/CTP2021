
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



///https://programmers.co.kr/learn/courses/30/lessons/42888
func solution(_ record:[String]) -> [String] {
    
    let chatRoom = ChatRoom()
    for rec in record {
        chatRoom.command(rec)
    }
    return chatRoom.makeStringArray()
}

class ChatRoom {
    var nickNameDic:[String:String] = [:]
    var messages: [Message] = []
    
    func command(_ command: String) {
        let strs = command.components(separatedBy: " ")
        if strs[0] == "Enter" {
            nickNameDic[strs[1]] = strs[2]
            messages.append(Message(strs[1], Status.enter))
        } else if strs[0] == "Change" {
            nickNameDic[strs[1]] = strs[2]
        } else {
            messages.append(Message(strs[1], Status.leave))
        }
    }
    
    func makeStringArray() -> [String] {
        var result: [String] = []
        
        for message in messages {
            result.append(nickNameDic[message.uid]! + message.status)
        }
        return result
    }
}



struct Message {
    let uid: String
    let status: String
    
    init(_ uid: String, _ status: Status) {
        self.uid = uid
        self.status = status.rawValue
    }
}

enum Status: String {
    case enter = "님이 들어왔습니다."
    case leave = "님이 나갔습니다."
}


////https://programmers.co.kr/learn/courses/30/lessons/77484
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var jokerCount = 0
    var correctCount = 0
    for my in lottos {
        if my == 0 {
            jokerCount += 1
        }
        for win in win_nums {
            if my ^ win == 0 {
                correctCount += 1
            }
        }
    }
    return [rank(correctCount+jokerCount), rank(correctCount)]
}

func rank(_ correctCount: Int) -> Int {
    switch correctCount {
    case 6: return 1
    case 5: return 2
    case 4: return 3
    case 3: return 4
    case 2: return 5
    default: return 6
    }
}