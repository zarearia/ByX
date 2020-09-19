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

import jwt

# encodeing and decoding JWT
################################################################################
json_data = {
    'email':'email@email.com',
    'password':'1234'
}

json_encoded = jwt.encode(json_data, 'secret_key')
print(json_encoded)

json_decoded = jwt.decode(json_encoded, 'secret_key')
print(json_decoded)


try:
    jwt.decode(json_encoded, 'secret_key')
    print('OK')
except:
    print('NOT OK')



################################################################################