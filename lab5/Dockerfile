# Sử dụng image Node.js chính thức
FROM node:16

# Tạo thư mục làm việc cho ứng dụng
WORKDIR /app

# Sao chép file package.json và package-lock.json (nếu có)
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install

# Sao chép mã nguồn ứng dụng vào container
COPY . .

# Mở cổng 3000 cho ứng dụng Node.js
EXPOSE 3000

# Chạy ứng dụng Node.js
CMD ["npm", "start"]
