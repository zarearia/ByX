import bcrypt

# encodeing and decoding password
################################################################################

# password = bytes('1234', 'ascii')

# hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())
# pass_str = str(hashed_password)
# print(str(pass_str[2:-1]))
# if bcrypt.checkpw(password, bytes(pass_str[2:-1], 'ascii')):
#     print("It Matches!")

################################################################################

# import jwt

# encodeing and decoding JWT
################################################################################
# json_data = {
#     'email':'email@email.com',
#     'password':'1234'
# }

# json_encoded = jwt.encode(json_data, 'secret_key')
# print(json_encoded)

# json_decoded = jwt.decode(json_encoded, 'secret_key')
# print(json_decoded)


# try:
#     jwt.decode(json_encoded, 'secret_key')
#     print('OK')
# except:
#     print('NOT OK')



################################################################################

import numpy as np

first_array = [0]

for i in range(1, 100):
    first_array.append(i)

second_array = [100]

for i in range(1,11):
    second_array.append((i+1)*100)

zeros_array = np.zeros(110, 'float32')

zeros_array = [number if number % 10 != 0 else -1 for number in first_array]

j = 0
for i in range (0, 100, 10):
    zeros_array[i] = second_array[j]
    j += 1

print(zeros_array)







# array = [[1,2,3], [4,5,6]]
# # array = [[i[j] for i in array] for j in [1,2,0]]
# array = [[i[j] for j in [1,2,0]] for i in array]
