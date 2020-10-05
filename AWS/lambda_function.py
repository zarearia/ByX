import json
import boto3
from boto3.dynamodb.conditions import Key, Attr
import decimal
import datetime
import bcrypt
import random
from botocore.exceptions import ClientError
import jwt

# Notes
################################################################################
# I Didn't use isReported attribute, insted isSpam = 1 means spam and isSpam = 2
# means reported.
################################################################################

# Helper class to convert a DynamoDB item to JSON.
class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            if o % 1 > 0:
                return float(o)
            else:
                return int(o)
        return super(DecimalEncoder, self).default(o)

null_dateTime = "2000-00-00T00:00:01.000000"

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('XModelTypeTable')
users_table = dynamodb.Table('XUserTypeTable')

jwt_secret_key = 'NqvnmP40f2bdY29OWEjN9NlZ0Doi66p'

blocked_words = set(line.strip() for line in open('blocked_words.txt'))


# Email SetUp
###############################################################################

# TODO: Change email cofigs for globalization
email_sender = "by XApp <xappemailtest2020@gmail.com>"
email_subject = "by XApp Confirmation Code"

CHARSET = "UTF-8"

ses_client = boto3.client('ses', region_name='us-east-1')


################################################################################


def lambda_handler(event, context):
    
    # Utilities
################################################################################
    

    def detach_evaluatedKey_and_email(json_data):
        data = json_data
        email = event['LastEvaluatedKey']['email']
        data.pop('email', None)
        # data = json.dump(data, 4, in)
        return(data, email)
        
        
    def spam_check(title):
        title = title.casefold()
        return 1 in [c in title for c in blocked_words]
        

################################################################################
        
    
    # Create Item
################################################################################

    def create_item():
        args = event['arguments']
        
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        user_item = user_response['Item']
        
        datetime_now = datetime.datetime.now().isoformat()
        
        if args['isUpgraded'] == 1:
            date_upgraded = datetime_now
        else:
            date_upgraded = null_dateTime
        
        is_spam = 0
        if spam_check(args['title']):
            is_spam = 1
        
        response = table.put_item(
            Item={
                'id': event['id'],
                'email': args['email'],
                'title': args['title'],
                'isUpgraded': args['isUpgraded'],
                'tags': args['tags'],
                'isSpam': is_spam,
                'dateCreated': str(datetime_now),
                'dateUpgraded': date_upgraded,
                'dislikesCount': 0,
                'likesCount' : 0,
                'reportsCount': 0,
                'isReported': 0,
                'isLikedByTheUser': False,
                'isDislikedByTheUser': False,
                'isReportedByTheUser': False
            },
            ReturnValues="ALL_OLD"
        )
        print("PutItem succeeded:")
        
        response = table.get_item(
            Key={
                'id': event['id']
            }
        )
        
        users_table.update_item(
            Key={
                'email': args['email']
            },
            UpdateExpression="ADD posts :id",
            ExpressionAttributeValues={
                ":id": set([event['id']])
            }
            # ReturnValues="UPDATED_NEW"
        )

        return response['Item']
        # return {
        #     'statusCode': 200,
        #     'body': response['Attributes']
        # }

        
################################################################################
        
        
    # Update Item
################################################################################

    def update_item():
        args = event['arguments']
        response = table.update_item(
            Key={
                'id': args['id'],
            },
            UpdateExpression="set title = :ti, isUpgraded = :iU, tags = :ta",
            ExpressionAttributeValues={
                ':ti': args['title'],
                ':iU': args['isUpgraded'],
                ':ta': args['tags']
            },
            ReturnValues="ALL_NEW"
        )
        print("UpdateItem succeeded:")
        
        return response['Attributes']
        # return {
        #     'statusCode': 200,
        #     'body': json.dumps(response, indent=4, cls=DecimalEncoder)
        # }
        
    
    # Delete Item
################################################################################
    
    def delete_item():
        args = event['arguments']
        
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        user_item = user_response['Item']
        
        response = table.delete_item(
            Key={
                'id': args['id'],
            }
        )
        
        users_table.update_item(
            Key={
                'email': args['email']
            },
            UpdateExpression="DELETE posts :id",
            ExpressionAttributeValues={
                ":id": set([args['id']])
            }
            # ReturnValues="UPDATED_NEW"
        )
        
        return {
            'statusCode': 200,
            'body': json.dumps(response)
        }
        
################################################################################


    # Get Item
################################################################################
    
    def get_item():
        
        args = event['arguments']
        response = table.get_item(
            Key={
                'id': args['id']
            }
            # ReturnValues="ALL_OLD"
        )
        
        item = response['Item']
        print(item)
        return item
        # return {
        #     'statusCode': 200,
        #     'body': json.dumps(item, indent=4, cls=DecimalEncoder)
        # }

################################################################################


    # Get All Items
################################################################################

    def get_all_items(lastEvaluatedKey):
        (lastEvaluatedKey, email) = detach_evaluatedKey_and_email(lastEvaluatedKey)

        limit = 12
        if lastEvaluatedKey['isUpgraded'] == 1:
            limit = 4
        
        if lastEvaluatedKey['id'] != "":
            response = table.query(
                IndexName='isSpam-isUpgraded-index',
                # KeyConditionExpression=Key('isSpam').eq(0),
                KeyConditionExpression=Key('isSpam').eq(lastEvaluatedKey['isSpam']) & Key('isUpgraded').eq(lastEvaluatedKey['isUpgraded']),
                Limit=limit,
                ExclusiveStartKey=lastEvaluatedKey,
                ScanIndexForward=False
            )
        else:
            response = table.query(
                IndexName='isSpam-isUpgraded-index',
                # KeyConditionExpression=Key('isSpam').eq(0),
                # ProjectionExpression="isSpam, isUpgraded",
                KeyConditionExpression=Key('isSpam').eq(lastEvaluatedKey['isSpam']) & Key('isUpgraded').eq(lastEvaluatedKey['isUpgraded']),
                Limit=limit,
                ScanIndexForward=False
            )
            
        user_response = users_table.get_item(
            Key={
                'email': email
            }
        )
        
        user_item = user_response['Item']
        liked_posts = user_item['liked']
        disliked_posts = user_item['disliked']
        reported_posts = user_item['reported']
        items = response['Items']
        for item in items:
            if item['id'] in liked_posts:
                item['isLikedByTheUser'] = True
            elif item['id'] in disliked_posts:
                item['isDislikedByTheUser'] = True
            elif item['id'] in reported_posts:
                item['isReportedByTheUser'] = True
                
        return response
        

    # Sorted By Likes
    #########################################################
    
    def get_all_items_sorted_by_likes(lastEvaluatedKey):
        (lastEvaluatedKey, email) = detach_evaluatedKey_and_email(lastEvaluatedKey)

        limit = 12
        if lastEvaluatedKey['isUpgraded'] == 1:
            limit = 4

        if lastEvaluatedKey['id'] != "":
            response = table.query(
                IndexName='isSpam-likesCount-index',
                KeyConditionExpression=Key('isSpam').eq(0),
                FilterExpression=Attr('isUpgraded').eq(lastEvaluatedKey['isUpgraded']),
                Limit=100,
                ExclusiveStartKey=lastEvaluatedKey,
                ScanIndexForward=False
            )
        else:
            response = table.query(
                IndexName='isSpam-likesCount-index',
                KeyConditionExpression=Key('isSpam').eq(0),
                FilterExpression=Attr('isUpgraded').eq(lastEvaluatedKey['isUpgraded']),
                Limit=100,
                ScanIndexForward=False
            )
            
        user_response = users_table.get_item(
            Key={
                'email': email
            }
        )
        
        user_item = user_response['Item']
        liked_posts = user_item['liked']
        disliked_posts = user_item['disliked']
        reported_posts = user_item['reported']
        items = response['Items']
        for item in items:
            if item['id'] in liked_posts:
                item['isLikedByTheUser'] = True
            elif item['id'] in disliked_posts:
                item['isDislikedByTheUser'] = True
            elif item['id'] in reported_posts:
                item['isReportedByTheUser'] = True

        return response
        
        
    # Sorted By Dislikes
    #########################################################
        
    def get_all_items_sorted_by_dislikes(lastEvaluatedKey):
        (lastEvaluatedKey, email) = detach_evaluatedKey_and_email(lastEvaluatedKey)
        if lastEvaluatedKey['id'] != "":
            response = table.query(
                IndexName='isSpam-dislikesCount-index',
                KeyConditionExpression=Key('isSpam').eq(0),
                Limit=100,
                ExclusiveStartKey=lastEvaluatedKey,
                ScanIndexForward=False
            )
        else:
            response = table.query(
                IndexName='isSpam-dislikesCount-index',
                KeyConditionExpression=Key('isSpam').eq(0),
                Limit=100,
                ScanIndexForward=False
            )
            
        user_response = users_table.get_item(
            Key={
                'email': email
            }
        )
        
        user_item = user_response['Item']
        liked_posts = user_item['liked']
        disliked_posts = user_item['disliked']
        reported_posts = user_item['reported']
        items = response['Items']
        for item in items:
            if item['id'] in liked_posts:
                item['isLikedByTheUser'] = True
            elif item['id'] in disliked_posts:
                item['isDislikedByTheUser'] = True
            elif item['id'] in reported_posts:
                item['isReportedByTheUser'] = True
                
        return response
        
################################################################################
        
       
    # Scan Tags
################################################################################


    def scan_tags(lastEvaluatedKey):
        
        (lastEvaluatedKey, email) = detach_evaluatedKey_and_email(lastEvaluatedKey)
        searched_tags = lastEvaluatedKey['tags']
        lastEvaluatedKey.pop('tags', None)
        if lastEvaluatedKey['id'] != "":
            response = table.scan(
                FilterExpression=Attr('title').contains(searched_tags),
                ExclusiveStartKey=lastEvaluatedKey
            )
        else:
            response = table.scan(
                FilterExpression=Attr("title").contains(searched_tags),
                # Limit=10
            )
            
        return response
            
        user_response = users_table.get_item(
            Key={
                'email': email
            }
        )
        
        user_item = user_response['Item']
        liked_posts = user_item['liked']
        disliked_posts = user_item['disliked']
        reported_posts = user_item['reported']
        items = response['Items']
        for item in items:
            if item['id'] in liked_posts:
                item['isLikedByTheUser'] = True
            elif item['id'] in disliked_posts:
                item['isDislikedByTheUser'] = True
            elif item['id'] in reported_posts:
                item['isReportedByTheUser'] = True
                
        return response
        
################################################################################
        
        
    # Like Item
################################################################################


    def like_item():
        
        args = event['arguments']
        
        
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        user_item = user_response['Item']
        liked_posts = user_item['liked']
        
        item_response = table.get_item(
            Key={
                'id': args['id']
            }
        )
        item = item_response['Item']
        
        val = 0
        if item['id'] in liked_posts:
            print("remove")
            val = -1
            users_table.update_item(
                Key={
                    'email': args['email']
                },
                UpdateExpression="DELETE liked :id",
                ExpressionAttributeValues={
                    ":id": set([args['id']])
                }
                # ReturnValues="UPDATED_NEW"
            )
        else:
            print("add")
            val = 1
            users_table.update_item(
                Key={
                    'email': args['email']
                },
                UpdateExpression="ADD liked :id",
                ExpressionAttributeValues={
                    ":id": set([args['id']])
                },
                ReturnValues="UPDATED_NEW"
            )
        
        response = table.update_item(
            Key={
                'id': args['id'],
            },
            UpdateExpression="set likesCount = likesCount + :val",
            ExpressionAttributeValues={
                ':val': decimal.Decimal(val)
            },
            ReturnValues="ALL_NEW"
        )
        
        print("like succeeded:")
        return response["Attributes"]


################################################################################


    # Dislike Item
################################################################################


    def dislike_item():
        
        args = event['arguments']
        
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        user_item = user_response['Item']
        disliked_posts = user_item['disliked']
        
        item_response = table.get_item(
            Key={
                'id': args['id']
            }
        )
        item = item_response['Item']
        
        val = 0
        if item['id'] in disliked_posts:
            print("remove")
            val = -1
            users_table.update_item(
                Key={
                    'email': args['email']
                },
                UpdateExpression="DELETE disliked :id",
                ExpressionAttributeValues={
                    ":id": set([args['id']])
                },
                ReturnValues="UPDATED_NEW"
            )
        else:
            print("add")
            val = 1
            users_table.update_item(
                Key={
                    'email': args['email']
                },
                UpdateExpression="ADD disliked :id",
                ExpressionAttributeValues={
                    ":id": set([args['id']])
                },
                ReturnValues="UPDATED_NEW"
            )
        
        response = table.update_item(
            Key={
                'id': args['id'],
            },
            UpdateExpression="set dislikesCount = dislikesCount + :val",
            ExpressionAttributeValues={
                ':val': decimal.Decimal(val)
            },
            ReturnValues="UPDATED_NEW"
        )
        
        print("dislike succeeded:")
        return response["Attributes"]
        

################################################################################


    # Reporte Item
################################################################################
        
        
    def report_item():
        
        args = event['arguments']
        
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        user_item = user_response['Item']
        reported_posts = user_item['reported']
        
        item_response = table.get_item(
            Key={
                'id': args['id']
            }
        )
        item = item_response['Item']
        
        val = 0
        if item['id'] in reported_posts:
            print("remove")
            val = -1
            users_table.update_item(
                Key={
                    'email': args['email']
                },
                UpdateExpression="DELETE reported :id",
                ExpressionAttributeValues={
                    ":id": set([args['id']])
                }
                # ReturnValues="UPDATED_NEW"
            )
        else:
            print("add")
            val = 1
            users_table.update_item(
                Key={
                    'email': args['email']
                },
                UpdateExpression="ADD reported :id",
                ExpressionAttributeValues={
                    ":id": set([args['id']])
                },
                ReturnValues="UPDATED_NEW"
            )
        
        response = table.update_item(
            Key={
                'id': args['id'],
            },
            UpdateExpression="set reportsCount = reportsCount + :val",
            ExpressionAttributeValues={
                ':val': decimal.Decimal(val)
            },
            ReturnValues="UPDATED_NEW"
        )
        
        report_count = response["Attributes"]["reportsCount"]
        like_and_dislike_count = item['dislikesCount'] + item['likesCount']
        like_and_dislike_count_limit = like_and_dislike_count / 4
        
        if report_count > 25 and report_count >= like_and_dislike_count_limit:
            response = table.update_item(
                Key={
                    'id': args['id'],
                },
                UpdateExpression="set isSpam = :is",
                ExpressionAttributeValues={
                    ':is': decimal.Decimal(2)
                },
                ReturnValues="ALL_NEW"
            )
        
        
        print("report succeeded:")
        return response["Attributes"]
        
        
################################################################################


    # Get All User Posts
################################################################################

    
    def get_all_items_user(lastEvaluatedKey):
        print(lastEvaluatedKey)
        # (lastEvaluatedKey, email) = detach_evaluatedKey_and_email(lastEvaluatedKey)
        if lastEvaluatedKey['id'] != "":
            response = table.query(
                IndexName='email-dateCreated-index',
                KeyConditionExpression=Key('email').eq(lastEvaluatedKey['email']),
                Limit=100,
                ExclusiveStartKey=lastEvaluatedKey,
                ScanIndexForward=False
            )
        else:
            response = table.query(
                IndexName='email-dateCreated-index',
                KeyConditionExpression=Key('email').eq(lastEvaluatedKey['email']),
                Limit=100,
                ScanIndexForward=False
            )
            
        user_response = users_table.get_item(
            Key={
                'email': lastEvaluatedKey['email']
            }
        )
        
        user_item = user_response['Item']
        liked_posts = user_item['liked']
        disliked_posts = user_item['disliked']
        reported_posts = user_item['reported']
        items = response['Items']
        for item in items:
            if item['id'] in liked_posts:
                item['isLikedByTheUser'] = True
            elif item['id'] in disliked_posts:
                item['isDislikedByTheUser'] = True
            elif item['id'] in reported_posts:
                item['isReportedByTheUser'] = True

        return response


################################################################################
        
        
    # Admin Controle
################################################################################


    def admin_controle():
        args = event['arguments']
        
        if args['accept'] == True:
            response = table.update_item(
                Key={
                    'id': args['id'],
                },
                UpdateExpression="set isSpam = :is",
                ExpressionAttributeValues={
                    ':is': 0
                },
                ReturnValues="ALL_NEW"
            )
            print("UpdateItem succeeded:")
            return response['Attributes']
        else:
            response = table.delete_item(
                Key={
                    'id': args['id'],
                }
            )
            return response
            
        
        
################################################################################



    # Authentication
################################################################################################################################################################


    # Sign_Up
################################################################################

    def sign_up():
        
        args = event['arguments']

        # Check if the email already exists
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        
        is_email_new = False
        try:
            user_item = user_response['Item']
        except:
            is_email_new = True
        
        if is_email_new == False:
            if user_item['Item']['confirmed'] == False:
                is_email_new = True

        if is_email_new == False:
            return {
                'statusCode': 403,
                'body': 'email is taken'
            }
        
        password = bytes(args['password'], 'ascii')

        hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())
        hashed_password_str = str(hashed_password)
        
        confirmation_code = random.randint(1000, 9999)
        
        # exp: 'password': hashed_password_str[2,-1] converting binery to string and 
        # removing b'' in b'<encodedpassword>' and then just remains the encodedpassword
        response = users_table.put_item(
            Item={
                'email': args['email'],
                'name': args['name'],
                'confirmationCode': confirmation_code,
                'confirmed': False,
                'numberOfCoupens': 0,
                'password': hashed_password_str[2: -1],
                'liked': {'null'},
                'disliked': {'null'},
                'reported': {'null'},
            },
            ReturnValues="ALL_OLD"
        )
        print("Signed_Up succeeded")

        # Sending Email
        #######################

        # Try to send the email.
        try:
            # Provide the contents of the email.
            response = ses_client.send_email(
                Destination={
                    'ToAddresses': [
                        args['email'],
                    ],
                },
                Message={
                    'Body': {
                        'Text': {
                            'Charset': CHARSET,
                            'Data': 'your confitmation code is: ' + str(confirmation_code),
                        },
                    },
                    'Subject': {
                        'Charset': CHARSET,
                        'Data': email_subject,
                    },
                },
                Source=email_sender,
            )
        # Display an error if something goes wrong.
        except ClientError as e:
            print('error:')
            print(e.response['Error']['Message'])
            return {
                'statusCode': 500,
                'body': 'SignUp uncomplete and sending email failed. Error :' + e.response['Error']['Message']
            }
        else:
            print("Email sent! Message ID:"),
            print(response['MessageId'])
            return {
                'statusCode': 200,
                'body': 'SignUp complete, sent email'
            }

        #######################


################################################################################


    # Email_Verification
################################################################################
    def confirm_email():
        args = event['arguments']
        
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        
        try:
            user_item = user_response['Item']
        except:
            return {
                'statusCode': 403,
                'body': 'invalid email'
            }
        
        confirmation_code = user_item['confirmationCode']

        print(confirmation_code)
        
        if args['confirmationCode'] == confirmation_code:
            users_table.update_item(
                Key={
                    'email': args['email']
                },
                UpdateExpression="set confirmed = :value",
                ExpressionAttributeValues={
                    ":value": True
                }
            )
            
            users_token = jwt.encode({'email':args['email']}, jwt_secret_key)

            return {
                'statusCode': 200,
                'body': 'Email Verified',
                'token': str(users_token)[2:-1]
            }
        else:
            return {
                'statusCode': 200,
                'body': 'Confirmation code doesnt match',
                'token': ''
            }
        

################################################################################


    # Token Verification
################################################################################
    def verify_token(token):
        try:
            jwt.decode(token, jwt_secret_key)
            return True
        except:
            return False

################################################################################


    # Sign_In
################################################################################
    def sign_in():
        args = event['arguments']
        
        user_response = users_table.get_item(
            Key={
                'email': args['email']
            }
        )
        
        try:
            user_item = user_response['Item']
        except:
            return {
                'statusCode': 403,
                'body': 'invalid email',
                'token': ''
            }

        if user_item['confirmed'] == False:
            return {
                'statusCode': 403,
                'body': 'email is not confirmed',
                'token': ''
            }

        user_password = bytes(user_item['password'], 'ascii')
        entered_password = bytes(args['password'], 'ascii')

        if bcrypt.checkpw(entered_password, user_password):
            users_token = jwt.encode({'email':args['email']}, jwt_secret_key)
            return {
                'statusCode': 200,
                'body': 'signed in',
                'token': str(users_token)[2:-1]
            }
        else:
            return {
                'statusCode': 200,
                'body': 'invalid password',
                'token': ''
            }


################################################################################


################################################################################################################################################################

    def increase_user__number_of_coupens():

        args = event['arguments']
        response = users_table.update_item(
            Key={
                'email': args['email'],
            },
            UpdateExpression="set numberOfCoupens = numberOfCoupens + :noc",
            ExpressionAttributeValues={
                ':noc': decimal.Decimal(args['numberOfCoupens'])
            },
            ReturnValues="ALL_NEW"
        )
        return {
                'statusCode': 200,
                'body': 'Successfuly increased number of coupens'
            }
        print("Successfuly increased number of coupens")


################################################################################

# Test Get Items
################################################################################

    def detach_evaluatedKey_and_email(json_data):
        data = json_data
        email = event['LastEvaluatedKey']['email']
        data.pop('email', None)
        # data = json.dump(data, 4, in)
        return(data, email)


################################################################################






    if event["field"] != 'sign_up' and event["field"] != 'confirm_email' and event["field"] != 'sign_in':

        is_token_valid = verify_token(event['token'])
        
        if is_token_valid == False:
            return {
                'statusCode': 401,
                'body': 'Unauthorized: token is not valid'
            }


    crud_funcs = {
        "create_item": create_item,
        "update_item": update_item,
        "delete_item": delete_item,
        "get_item": get_item,
        "like_item": like_item,
        "dislike_item": dislike_item,
        "report_item": report_item,
        "admin_controle": admin_controle,
        "sign_up": sign_up,
        "confirm_email": confirm_email,
        "sign_in": sign_in,
        "increase_user__number_of_coupens": increase_user__number_of_coupens
    }
    
    
    batch_get_items = {
        "get_all_items": get_all_items,
        "get_all_items_sorted_by_likes": get_all_items_sorted_by_likes,
        "get_all_items_sorted_by_dislikes": get_all_items_sorted_by_dislikes,
        "scan_tags": scan_tags,
        "get_all_items_user": get_all_items_user
    }
    
    
    if "get_all_items" not in event["field"] and event["field"] != "scan_tags":
        result = crud_funcs[event["field"]]()
    else:
        result = batch_get_items[event["field"]](event["LastEvaluatedKey"])
        
    return result
