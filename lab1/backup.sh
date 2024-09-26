#!/bin/bash

# Đường dẫn thư mục gốc cần sao lưu
SOURCE_DIR="/home/chithanh2001/tech/source"

# Đường dẫn thư mục đích để lưu bản sao lưu
BACKUP_DIR="/home/chithanh2001/tech/backup"

# Tên file nén, bao gồm ngày giờ để dễ phân biệt
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

# Kiểm tra nếu thư mục nguồn tồn tại
if [ ! -d "$SOURCE_DIR" ]; then
  echo "source dir doesn't exist: $SOURCE_DIR"
  exit 1
fi

# Tạo thư mục backup nếu chưa có
mkdir -p "$BACKUP_DIR"

# Sao lưu và nén dữ liệu
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" .

# Kiểm tra xem quá trình sao lưu có thành công không
if [ $? -eq 0 ]; then
  echo "Backup successful!"
  echo "The backup file has been created: $BACKUP_DIR/$BACKUP_FILE"
else
  echo "The backup process encountered an error!"
  exit 1
fi

