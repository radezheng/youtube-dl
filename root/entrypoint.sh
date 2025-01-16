#!/bin/bash

echo "[startup] Running init scripts..."

set -x
echo "--------------Start.sh--------------"
git clone https://${GitToken}@github.com/radezheng/youtube-dl.git /app/youtube-dl

cp -f /app/youtube-dl/root/app/youtube-dl.sh /app/youtube-dl/youtube-dl.sh
chmod +x /app/youtube-dl/youtube-dl.sh

for init in $(ls /etc/cont-init.d/); do
  /etc/cont-init.d/$init
done

echo -e "[startup] Finished.\n"

/bin/supervisord -c /etc/supervisor/supervisord.conf
