# 2-1. 숫자 자료형
print(5)
print(-10)
print(3.14)
print(1000)

print(5+3) 
print(2*8)
print(3*(3+1))

# 2-2. 문자열 자료형
print('풍선')
print("나비")
print("ㅋㅋㅋㅋㅋㅋㅋ")
print("ㅋ"*8)

# 2-3. boolean 자료형 ( 참 / 거짓 )
print(5 > 10)
print(5 < 10)
print(True) 
print(False)
print(not True)
print(not False)
print(not (5 > 10))

# 2-4. 변수
# 애완동물을 소개해 주세요 !
animal = "강아지"
name = "연탄이"
age = 4
hobby = "산책"
is_adult = age >= 3

# 정수형, boolean을 +로 출력할때는 문자열로 바꿔주는 str로 감싸줘야 오류가 나지않는다.
# , 로 출력하면 str로 감싸주지 않아도 된다. 띄어쓰기 포함되는것 참고
print("우리집 " + animal + "의 이름은 " + name + "이에요")
hobby = "공놀이"
#print(name + "이는 " + str(age) + "살이며, " + hobby + "을 아주 좋아해요")
print(name , "이는 " , age , "살이며, " , hobby , "을 아주 좋아해요")
print("나이는 어른일까요? " + str(is_adult))

# 2-5. 주석 
# 한줄주석 
''' 여러문장 주석처리
작은따옴표 3개 하면 된다 '''

# 2-6. Quiz) 변수를 이용하여 다음 문장을 출력하시오
station = "사당"
print(station + "행 열차가 들어오고 있습니다.")

# 3-1. 연산자
print(1+1) # 2
print(3-2) # 1
print(5*2) # 10
print(6/3) # 2

print(2**3) # 2^3 = 8
print(5%3) # 나머지 구하기 2
print(10%3) # 1
print(5//3) # 몫 구하기 1
print(10//3) # 3
print(10/3) # * -> 3.3333333333333335

print(10 > 3) # True
print(4 >= 7) # False
print(10 < 3) # False
print(5 <= 5) # True

print(3 == 3) # True
print(4 == 2) # False
print(3 + 4 == 7) # True

print(1 !=3 ) # True
print(not (1 !=3)) # False

print((3 > 0) and (3 < 5)) # True
print((3 > 0 ) & ( 3 < 5)) # True

print((3 > 0) or (3 > 5)) # True
print((3 > 0) | (3 > 5)) # True *자바는 ||

print(5 > 4 > 3) # True
print(5 > 4 > 7) # False

# 3-2. 간단한 수식
print(2 + 3 * 4) # 14
print((2 + 3) * 4) # 20

number = 2 + 3 * 4 # 14
print(number) 
number = number + 2 # 16
print(number)
number += 2 # 18
print(number)
number *= 2 # 36
print(number)
number /=2 # 18
print(number)
number -=2 # 16
print(number) 
number %= 5 #1
print(number)

# 3-3. 숫자처리 함수
print(abs(-5)) # 절대값. 5
print(pow(4, 2)) # 4^2 = 4*4 = 16
print(max(5, 12)) # 최대값반환. 12
print(min(5, 12, 3, 2)) # 최소값반환. 2
print(round(3.14)) # 반올림. 3
print(round(4.99)) # 반올림. 5

# Python에서 제공하는 math라이브러리 이용
from math import *
print(floor(4.99)) # 내림. 4
print(ceil(3.14)) # 올림. 4
print(sqrt(16)) # 제곱근(루트16). 4.0

# 3-4. 랜덤함수(난수)
from random import *

print(random()) # 0.0 ~ 1.0 미만의 임의의 값 생성
print(random() * 10) # 0.0 ~ 10.0 미만의 임의의 값 생성
print(int(random() * 10)) # 0 ~ 10 미만의 임의의 값 생성
print(int(random() * 10 ) + 1) # 1 ~ 10 이하의 임의의 값 생성
print(int(random() *45) + 1) # 1 ~ 45 이하의 임의의 값 생성

print(randrange(1 , 46)) # 1 ~ 46 미만의 임의의 값 생성
print(randint(1, 45)) # 1 ~ 45 이하의 임의의 값 생성

# 3-5. Quiz)
date = randint(4, 28)
print("오프라인 스터디 모임 날짜는 매월 "+ str(date) +" 일로 선정되었습니다")
 


