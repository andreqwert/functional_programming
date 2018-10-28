
values = [5, 'abc', 'abd', 20, 50, 71, 64]   # значения, которые нужно разложить на множители


def is_int(var):
	if type(var) is not int:
		#raise TypeError('Value is not integer')
		print(var, '-->', 'Test Failed (var is not int)')
		return None
	else:
		print(var, '-->', 'Test OK')
		return True


def factorize(n):
	i = 2
	multipliers = []
	while i * i <= n:
		while n % i == 0:
			multipliers.append(i)
			n /= i
		i += 1
	if n > 1:
		multipliers.append(n)
	print('Multipliers:', multipliers)
	return multipliers


def run_tests(multipliers):
	
	print('--'*20)
	if factorize(16) == [2, 2, 2, 2]:
		print(str(16) + ' --> ' + 'Test OK')
	else:
		print(str(16) + ' --> ' + 'Test failed')
	

	print('--'*20)
	if factorize(64) == [2, 2, 2, 2, 2, 2]:
		print(str(64) + ' --> ' + 'Test OK')
	else:
		print(str(64) + ' --> ' + 'Test failed')
	

	print('--'*20)
	if factorize(5) == [5]:
		print(str(5) + ' --> ' + 'Test OK')
	else:
		print(str(5) + ' --> ' + 'Test failed')



def main():
	for value in values:
		print('--'*20)
		if is_int(value):
			multipliers = factorize(value)
	print('\n'*3)
	print('Tests running')
	run_tests(multipliers)



if __name__ == '__main__':
	main()



