from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/api/people', methods=['GET'])
def hi_people():
    name = request.args.get('name')
    age = request.args.get('age')
    return jsonify({"message": f"Привет, {name}, тебе {age} лет."})

if __name__ == '__main__':
    app.run(port=3000)

# link
# http://localhost:3000/api/people?name=Олег&age=33

# output - {"message":"Привет, Олег, тебе 33 лет."}