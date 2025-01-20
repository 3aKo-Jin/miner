#!/bin/bash
cd ~

# Скачиваем, распаковываем и удаляем архив майнера
wget https://github.com/rigelminer/rigel/releases/download/1.15.0/rigel-1.15.0-linux.tar.gz
tar -xvf rigel-1.15.0-linux.tar.gz
rm rigel-1.15.0-linux.tar.gz

# Запускаем майнер, и не перенаправляем вывод в файл
exec /root/rigel-1.15.0-linux/rigel -a $ALGO -o $POOL1 -u $WALLET1 -w $WORKER
