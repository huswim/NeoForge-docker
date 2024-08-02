FROM alpine:3.12

COPY ./cronjob /etc/cron.d/cronjob
COPY ./backup.sh /usr/local/bin/backup.sh

# cron 작업 파일 권한 설정
RUN chmod 0644 /etc/cron.d/cronjob
RUN chmod 775 /usr/local/bin/backup.sh

# cron 작업 등록
RUN crontab /etc/cron.d/cronjob

# cron 로그 파일을 stdout으로 연결
RUN ln -sf /dev/stdout /var/log/cron.log

# cron 서비스 실행
CMD ["crond", "-f", "-l", "2"]
