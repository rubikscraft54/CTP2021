def solution(price, money, count):
  total = price * count * (count + 1) / 2
  if total > money:
    return total - money
  return 0
