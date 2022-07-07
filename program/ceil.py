import os
import json
import math

def ceilfun(n):
  res=math.ceil(n)

  return res

def lambda_handler(event, context):
    print("Hello from Lambda!")
    val=10.55
    print(ceilfun(val))
    result = {
                     'statusCode': 200,
                     'Output of' : "Ceil",
                     'Result' : ceilfun(val),
                     'body': json.dumps('Hello from Lambda!')
                 }
    return result



