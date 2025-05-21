#!/usr/bin/env bash

# 检查是否传入了图片路径
if [ $# -ne 1 ]; then
  echo "Usage: $0 <image_file>"
  exit 1
fi

# 获取输入的图片路径
image_path=$1

# 获取图片的宽度和高度
image_width=$(identify -format "%w" "$image_path")
image_height=$(identify -format "%h" "$image_path")

# 设置目标宽度
target_width=40

# 考虑字符的纵横比 (字符的宽度通常约为高度的 1:2)
target_height=$(echo "scale=0; $target_width * $image_height / $image_width / 2" | bc)

# 使用 img2txt 将图片转换为 ASCII 艺术，保持原始比例
img2txt -W $target_width -H $target_height -f ansi "$image_path"
