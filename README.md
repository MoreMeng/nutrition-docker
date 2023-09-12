## Deployment

1. clone `<git>` `<name>`
2. cd `<name>`
3. change docker-compose.yml specific port `<newport>:80`
4. docker-compose up -d
5. `chown -R 33:33 code`
   1. * 33 = www-data
ถ้าไม่ chown จะติด permission