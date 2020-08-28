#!/bin/bash

echo $DEPLOY_STAGE

echo "LOGIN TO GIGALIXIR"
gigalixir login -e $GIGALIXIR_EMAIL -p $GIGALIXIR_PASS -y

echo "SET REMOTE $DEPLOY_STAGE"
gigalixir git:remote $DEPLOY_STAGE

echo "PUSH TO GIGALIXIR"
git push -f gigalixir HEAD:master

echo "CHECK STATUS APP"
while true; do if [[ `gigalixir ps -a $DEPLOY_STAGE | grep Healthy | wc -l` == 1 ]]; then break; fi; sleep 2; done

echo "DELETE IF THE SSH FOLDER EXIST"
rm -rf /root/.ssh

echo "CREATE /.ssh"
mkdir /root/.ssh

echo "SET UP SSH"
printf "" > /root/.ssh/known_hosts
echo "$SSH_KEY" > /root/.ssh/deploy
echo "$SSH_PUBLIC_KEY" > /root/.ssh/deploy.pub

echo "SET PERMISSIONS"
chmod 755 /root/.ssh
chmod 600 /root/.ssh/deploy
chmod 644 /root/.ssh/deploy.pub

echo "MIGRATE"
gigalixir ps:migrate -a $DEPLOY_STAGE -o 'ssh -t -i /root/.ssh/deploy -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
