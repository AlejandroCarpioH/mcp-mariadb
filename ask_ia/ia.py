import os
from openai import OpenAI

def ia(query, prompt):

    messages = [
        {
                "role": "system",
               "content": f'{prompt}'
        },
        {
            "role": "user",
            "content": query
        }

    ]
    client = OpenAI()
    
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=messages
    )
    print(response.choices[0].message.content)

    return response.choices[0].message.content




def deepseek(query: str, prompt: str):

    messages = [
         {
                "role": "system",
                "content": f'{prompt}'
        },
        {
            "role": "user",
            "content": query
        }

    ]
    client = OpenAI(api_key=os.getenv("DEEPSEEK_API_KEY"), base_url="https://api.deepseek.com")

    response = client.chat.completions.create(
        model="deepseek-chat",
        messages=messages,
        stream=False,
        timeout=100
    )
  
    return response.choices[0].message.content





