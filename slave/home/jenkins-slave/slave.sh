kubectl create secret generic slaves-ssh-key --from-file=ssh-privatekey=slave/home/jenkins-slave/.ssh/id_rsa --from-file=ssh-publickey=slave/home/jenkins-slave/.ssh/id_rsa.pub --from-file=ssh-config=slave/home/jenkins-slave/.ssh/config