# Sử dụng image Python chính thức làm base
FROM python:3.9-slim

# # Đặt biến môi trường để Python không tạo file .pyc
# ENV PYTHONDONTWRITEBYTECODE=1
# # Đặt biến môi trường để Python không lưu buffer
# ENV PYTHONUNBUFFERED=1

# Tạo thư mục làm việc cho ứng dụng
WORKDIR /app

# Sao chép file requirements.txt để cài đặt các thư viện cần thiết
COPY requirements.txt .

# Cài đặt các dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép source code vào container
COPY . /app/

# expose port 5000
EXPOSE 5000

# Chạy lệnh để khởi động ứng dụng Flask
CMD ["flask", "run", "--host=0.0.0.0"]
