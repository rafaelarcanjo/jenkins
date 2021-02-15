curl --insecure -s -w '\\n%{response_code}' \
    --location --request POST http://172.16.100.102/login.php \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'user_name=admin' \
    --data-urlencode 'user_password=admin'