import os
import json
import math

def floorfun(n):
  res=math.floor(n)

  return res


def lambda_handler(event, context):
    print("Hello from Lambda!")
    val=10.55
    print(floorfun(val))
    result = {
                     'statusCode': 200,
                     'output of' : "Floor",
                     'Result' : floorfun(val),
                     'body': json.dumps('Hello from Lambda!')
                 }
    return result



