1. tạo cronjob: crontab -e
2. thiết lập cronjob chạy vào 2 giờ sáng mỗi ngày và đồng thời ghi lại logs: 0 2 * * * bash /home/chithanh2001/tech/backup.sh >> /home/chithanh2001/tech/backup.log 2>&1