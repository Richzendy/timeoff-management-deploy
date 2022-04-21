= Running Jenkins =

   export SSH_PRIVATE_KEY=$(cat /home/USER/.ssh/id_rsa) ; docker-compose up

Jenkins listen on http://localhost:8000

On first time copy the initial admin password from the debug output on CLI to unlock Jenkins and later install the suggested plugins, later follow the instructions.