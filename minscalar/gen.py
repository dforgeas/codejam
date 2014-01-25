from random import randint

print(5)
for n in range(5):
	l = randint(10,30)
	print(l)
	v=[randint(-100,100) for i in range(l)]
	print(*v)
	v=[randint(-100,100) for i in range(l)]
	print(*v)
