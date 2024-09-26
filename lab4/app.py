from flask import Flask

# Khởi tạo ứng dụng Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>HomePage!</h1>"

@app.route('/about')
def about():
    return "<h1>About Page</h1>"

# Chạy ứng dụng
app.run(debug=True)
