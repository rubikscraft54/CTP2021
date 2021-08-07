def solution(price, money, count):
  total = price * count * (count + 1) / 2
  if total > money:
    return total - money
  return 0

def solution(record):
    nameDict = {}
    answer = []
    for i in range(len(record)):
        s = record[i].split()
        if s[0] == 'Change':
            nameDict[s[1]] = s[2]
        elif s[0] == 'Enter':
            nameDict[s[1]] = s[2]
            answer.append(f'{s[1]} 님이 들어왔습니다.')
        elif s[0] == 'Leave':
            answer.append(f'{s[1]} 님이 나갔습니다.')
    for i in range(len(answer)):
        s = answer[i].split()
        answer[i] = (answer[i].replace(s[0], nameDict[s[0]])).replace(' ', "", 1)
        
def solution(lottos, win_nums):
    base = 0
    for i in lottos:
        if i in win_nums:
            base += 1
    answer = [7 - base - lottos.count(0), 7 - base]
    if answer[0] == 7:
        answer[0] = 6
    if answer[1] == 7:
        answer[1] = 6
    return answer
