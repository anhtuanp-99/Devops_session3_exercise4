#!/bin/bash

echo "--- Khởi chạy Frontend QA Container ---"

# Dọn dẹp container cũ nếu đã tồn tại để tránh lỗi trùng tên
if [ "$(docker ps -aq -f name=rikkei-frontend-qa)" ]; then
    echo "Phát hiện container cũ. Đang xóa..."
    docker rm -f rikkei-frontend-qa
fi

# Khởi chạy container Nginx với biến môi trường
echo "Đang khởi chạy container với API_ENDPOINT..."
docker run -d \
  --name rikkei-frontend-qa \
  -e API_ENDPOINT=https://qa-api.rikkei.edu.vn \
  nginx

echo "--- Khởi chạy hoàn tất ---"
echo "Để kiểm tra bên trong container, hãy chạy lệnh sau trên terminal:"
echo "docker exec -it rikkei-frontend-qa bash"
