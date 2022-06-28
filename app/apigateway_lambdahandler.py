import json

#https://gist.githubusercontent.com/djg07/678f7aea58b6c5b8d93c15af8577e0f2/raw/7e82a5b79dae9cd215c289d26d579aa3ffd7ab39/apigateway_lambdahandler.py

print('Loading function')

def lambda_handler(event, context):
	#1. Parse out query string params
	print(event)
	transactionId = event['queryStringParameters']['transactionId']
	transactionType = event['queryStringParameters']['type']
	transactionAmount = event['queryStringParameters']['amount']

	print('transactionId=' + transactionId)
	print('transactionType=' + transactionType)
	print('transactionAmount=' + transactionAmount)

	#2. Construct the body of the response object
	transactionResponse = {}
	transactionResponse['transactionId'] = transactionId
	transactionResponse['type'] = transactionType
	transactionResponse['amount'] = transactionAmount
	transactionResponse['message'] = 'Hello from Lambda land'

	#3. Construct http response object
	responseObject = {}
	responseObject['statusCode'] = 200
	responseObject['headers'] = {}
	responseObject['headers']['Content-Type'] = 'application/json'
	responseObject['body'] = json.dumps(transactionResponse)

	#4. Return the response object
	return responseObject

def
