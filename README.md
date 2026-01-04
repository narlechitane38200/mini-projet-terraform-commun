**Mini-projet-terraform-commun**



Le but de ce mini projet commun est de déployer via l’outil d’IaC Terraform, un serveur Jenkins sur un environnement AWS. Pour ce faire, j'ai utilisé différents modules afin de répondre aux exigences demandées.



Aussi j’ai utilisé comme serveur de déploiement Terraform, une machine EC2 Ubuntu.



Voici les étapes d’installation de l’outil sur ma machine :



`    `**1. wget https://releases.hashicorp.com/terraform/1.14.2/terraform\_1.14.2\_linux\_amd64.zip**

`    `**2. unzip terraform\_1.14.2\_linux\_amd64.zip**

`    `**3. sudo apt install unzip**

`    `**4. unzip terraform\_1.14.2\_linux\_amd64.zip**

`    `**5. chmod +x terraform**

`    `**6. sudo mv terraform /usr/local/bin/**

`    `**7. terraform**

`    `**8. terraform -version**




Une fois, l’installation terminée, j’ai importé, depuis mon repo github, l’ensemble de mon code.



Voici les étapes :

**ubuntu@ip-172-31-69-236:~$ git -v**

**git version 2.43.0**

**ubuntu@ip-172-31-69-236:~$ git init**

**`hint: Using 'master' as the name for the initial branch. This default branch name`**

**hint: is subject to change. To configure the initial branch name to use in all**

**hint: of your new repositories, which will suppress this warning, call:**

**hint:** 

**hint:   git config --global init.defaultBranch <name>**

**hint:** 

**hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and**

**hint: 'development'. The just-created branch can be renamed via this command:**

**hint:** 

**hint:   git branch -m <name>**

**Initialized empty Git repository in /home/ubuntu/.git/**

**ubuntu@ip-172-31-69-236:~$ git remote add origin [**https://github.com/narlechitane38200/mini-projet-terraform-commun.git**](https://github.com/narlechitane38200/mini-projet-terraform-commun.git)**

**ubuntu@ip-172-31-69-236:~$ git remote -v**

**origin  https://github.com/narlechitane38200/mini-projet-terraform-commun.git (fetch)**

**origin  https://github.com/narlechitane38200/mini-projet-terraform-commun.git (push)**

**ubuntu@ip-172-31-69-236:~$ git clone https://github.com/narlechitane38200/mini-projet-terraform-commun.git**

**Cloning into 'mini-projet-terraform-commun'...**

**remote: Enumerating objects: 106, done.**

**remote: Counting objects: 100% (106/106), done.**

**remote: Compressing objects: 100% (103/103), done.**

**remote: Total 106 (delta 24), reused 4 (delta 0), pack-reused 0 (from 0)**

**Receiving objects: 100% (106/106), 125.18 KiB | 17.88 MiB/s, done.**

**Resolving deltas: 100% (24/24), done.**

**ubuntu@ip-172-31-69-236:~$ ls -rtlh**

**total 30M**

**-rw-r--r-- 1 ubuntu ubuntu 4.9K Dec 11 11:54 LICENSE.txt**

**-rw-rw-r-- 1 ubuntu ubuntu  30M Dec 11 12:48 terraform\_1.14.2\_linux\_amd64.zip**

**drwxrwxr-x 7 ubuntu ubuntu 4.0K Dec 20 19:53 terraform-training**

**drwx------ 3 ubuntu ubuntu 4.0K Dec 27 11:20 snap**

**drwxrwxr-x 5 ubuntu ubuntu 4.0K Jan  4 10:59 mini-projet-terraform-commun**



Création d’un répertoire « .secrets » dans le projet « mini-projet-terraform-commun ». Celui contiendra le fichier « credentials » contenant les informations de connexion au compte AWS ainsi la future paire de clé générée lors du prochain déploiement.



Ensuite, on se place au niveau du répertoire « mini-projet-terraform-commun/app » contenant le root main.tf afin d’initialiser le répertoire terraform. Une fois, l’initialisation effectuée avec succès, nous lançons la commande « terraform apply » afin de déploiement l’infrastructure souhaitée dans le code :



**Enter a value: yes**

**module.jenkins\_keypair.tls\_private\_key.this: Creating...**

**module.jenkins\_ebs.aws\_ebs\_volume.this: Creating...**

**module.jenkins\_vpc.aws\_vpc.my\_vpc: Creating...**

**module.jenkins\_eip.aws\_eip.this: Creating...**

**module.jenkins\_eip.aws\_eip.this: Creation complete after 2s [id=eipalloc-0b0b647b173da4d22]**

**module.jenkins\_vpc.aws\_vpc.my\_vpc: Creation complete after 2s [id=vpc-0dd817a32b131beb0]**

**module.jenkins\_igw.aws\_internet\_gateway.my\_igw: Creating...**

**module.jenkins\_subnet.aws\_subnet.subnet: Creating...**

**module.jenkins\_rtb.aws\_route\_table.my\_rt: Creating...**

**module.jenkins\_sg.aws\_security\_group.this: Creating...**

**module.jenkins\_igw.aws\_internet\_gateway.my\_igw: Creation complete after 0s [id=igw-00dd9bc2877db11d2]**

**module.jenkins\_rtb.aws\_route\_table.my\_rt: Creation complete after 0s [id=rtb-0ae58096707cc3e97]**

**module.jenkins\_internet\_route.aws\_route.my\_route: Creating...**

**module.jenkins\_subnet.aws\_subnet.subnet: Creation complete after 0s [id=subnet-03ee5986e4d3aa7c6]**

**aws\_route\_table\_association.my\_rta: Creating...**

**aws\_route\_table\_association.my\_rta: Creation complete after 1s [id=rtbassoc-045a7d4c26bd55057]**

**module.jenkins\_internet\_route.aws\_route.my\_route: Creation complete after 1s [id=r-rtb-0ae58096707cc3e971080289494]**

**module.jenkins\_keypair.tls\_private\_key.this: Creation complete after 3s [id=7c62337c3fae665d268b2587966c56f8951f4991]**

**module.jenkins\_keypair.aws\_key\_pair.this: Creating...**

**module.jenkins\_keypair.local\_file.private\_key: Creating...**

**module.jenkins\_keypair.local\_file.private\_key: Creation complete after 0s [id=ecb3b093446667d00c2a72979627818499975fe9]**

**module.jenkins\_keypair.aws\_key\_pair.this: Creation complete after 1s [id=my-ec2-key]**

**module.jenkins\_sg.aws\_security\_group.this: Creation complete after 2s [id=sg-09d947490bd06fdb1]**

**module.jenkins\_ec2.aws\_instance.this: Creating...**

**module.jenkins\_ebs.aws\_ebs\_volume.this: Still creating... [00m10s elapsed]**

**module.jenkins\_ebs.aws\_ebs\_volume.this: Creation complete after 11s [id=vol-0e9b9fd5feaa95190]**

**module.jenkins\_ec2.aws\_instance.this: Still creating... [00m10s elapsed]**

**module.jenkins\_ec2.aws\_instance.this: Creation complete after 12s [id=i-0d1276fd485f539d9]**

**aws\_eip\_association.jenkins\_eip\_association: Creating...**

**aws\_volume\_attachment.jenkins\_ebs\_attachment: Creating...**

**aws\_eip\_association.jenkins\_eip\_association: Creation complete after 2s [id=eipassoc-06a5a55936b0362e7]**

**aws\_volume\_attachment.jenkins\_ebs\_attachment: Still creating... [00m10s elapsed]**

**aws\_volume\_attachment.jenkins\_ebs\_attachment: Still creating... [00m20s elapsed]**

**aws\_volume\_attachment.jenkins\_ebs\_attachment: Creation complete after 21s [id=vai-3521956075]**

**null\_resource.output\_metadata: Creating...**

**null\_resource.output\_metadata: Provisioning with 'remote-exec'...**

**null\_resource.output\_metadata (remote-exec): Connecting to remote host via SSH...**

**null\_resource.output\_metadata (remote-exec):   Host: 34.194.90.154**

**null\_resource.output\_metadata (remote-exec):   User: ubuntu**

**null\_resource.output\_metadata (remote-exec):   Password: false**

**null\_resource.output\_metadata (remote-exec):   Private key: true**

**null\_resource.output\_metadata (remote-exec):   Certificate: false**

**null\_resource.output\_metadata (remote-exec):   SSH Agent: false**

**null\_resource.output\_metadata (remote-exec):   Checking Host Key: false**

**null\_resource.output\_metadata (remote-exec):   Target Platform: unix**

**null\_resource.output\_metadata (remote-exec): Connected!**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 0% [Working]**

**null\_resource.output\_metadata (remote-exec): Hit:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy InRelease**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 0% [Connecting to security.ubuntu.com (**

**null\_resource.output\_metadata (remote-exec): Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]**

**null\_resource.output\_metadata (remote-exec): Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 0% [3 InRelease 127 kB/127 kB 100%] [Co**

**null\_resource.output\_metadata (remote-exec): 0% [Connecting to security.ubuntu.com (**

**null\_resource.output\_metadata (remote-exec): Get:4 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 0% [4 InRelease 14.2 kB/129 kB 11%]**

**null\_resource.output\_metadata (remote-exec): 0% [4 InRelease 14.2 kB/129 kB 11%]**

**null\_resource.output\_metadata (remote-exec): Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [14.1 MB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 0% [5 Packages 0 B/14.1 MB 0%] [4 InRel**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 0% [5 Packages 4963 kB/14.1 MB 35%] [4** 

**null\_resource.output\_metadata (remote-exec): 0% [5 Packages 6953 kB/14.1 MB 49%] [4** 

**null\_resource.output\_metadata (remote-exec): 0% [5 Packages 6988 kB/14.1 MB 50%]**

**null\_resource.output\_metadata (remote-exec): 29% [5 Packages 8764 kB/14.1 MB 62%]**

**null\_resource.output\_metadata (remote-exec): Get:6 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [2899 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 39% [5 Packages 14.1 MB/14.1 MB 100%] [**

**null\_resource.output\_metadata (remote-exec): 39% [6 Packages 91.0 kB/2899 kB 3%]**

**null\_resource.output\_metadata (remote-exec): 39% [5 Packages store 0 B] [Waiting for**

**null\_resource.output\_metadata (remote-exec): Get:7 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy/universe Translation-en [5652 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 39% [5 Packages store 0 B] [7 Translati**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 51% [5 Packages store 0 B] [6 Packages** 

**null\_resource.output\_metadata (remote-exec): Get:8 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata [286 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 51% [5 Packages store 0 B] [8 Commands-**

**null\_resource.output\_metadata (remote-exec): 52% [5 Packages store 0 B] [6 Packages** 

**null\_resource.output\_metadata (remote-exec): Get:9 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [217 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 52% [5 Packages store 0 B] [9 Packages** 

**null\_resource.output\_metadata (remote-exec): 52% [5 Packages store 0 B] [6 Packages** 

**null\_resource.output\_metadata (remote-exec): Get:10 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy/multiverse Translation-en [112 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 52% [5 Packages store 0 B] [10 Translat**

**null\_resource.output\_metadata (remote-exec): Get:11 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata [8372 B]**

**null\_resource.output\_metadata (remote-exec): Get:12 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [3161 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 53% [5 Packages store 0 B] [12 Packages**

**null\_resource.output\_metadata (remote-exec): Get:13 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [484 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 61% [5 Packages store 0 B] [13 Translat**

**null\_resource.output\_metadata (remote-exec): 62% [5 Packages store 0 B] [6 Packages** 

**null\_resource.output\_metadata (remote-exec): Get:14 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [19.0 kB]**

**null\_resource.output\_metadata (remote-exec): Get:15 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [5043 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 63% [5 Packages store 0 B] [15 Packages**

**null\_resource.output\_metadata (remote-exec): 67% [5 Packages store 0 B] [15 Packages**

**null\_resource.output\_metadata (remote-exec): Get:16 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en [417 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 74% [5 Packages store 0 B] [15 Packages**

**null\_resource.output\_metadata (remote-exec): 74% [5 Packages store 0 B] [15 Packages**

**null\_resource.output\_metadata (remote-exec): Get:17 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 c-n-f Metadata [644 B]**

**null\_resource.output\_metadata (remote-exec): Get:18 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1244 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 75% [5 Packages store 0 B] [18 Packages**

**null\_resource.output\_metadata (remote-exec): Get:19 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [14.0 kB]**

**null\_resource.output\_metadata (remote-exec): Get:20 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [4883 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 75% [5 Packages store 0 B] [18 Packages**

**null\_resource.output\_metadata (remote-exec): Get:21 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [310 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 79% [5 Packages store 0 B] [21 Translat**

**null\_resource.output\_metadata (remote-exec): Get:22 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [30.0 kB]**

**null\_resource.output\_metadata (remote-exec): Get:23 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [57.6 kB]**

**null\_resource.output\_metadata (remote-exec): Get:24 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en [13.2 kB]**

**null\_resource.output\_metadata (remote-exec): Get:25 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata [600 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 81% [5 Packages store 0 B] [25 Commands**

**null\_resource.output\_metadata (remote-exec): Get:26 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [69.4 kB]**

**null\_resource.output\_metadata (remote-exec): Get:27 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.5 kB]**

**null\_resource.output\_metadata (remote-exec): Get:28 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [412 B]**

**null\_resource.output\_metadata (remote-exec): Get:29 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata [116 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 82% [5 Packages store 0 B] [Waiting for**

**null\_resource.output\_metadata (remote-exec): Get:30 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [31.7 kB]**

**null\_resource.output\_metadata (remote-exec): Get:31 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [16.9 kB]**

**null\_resource.output\_metadata (remote-exec): Get:32 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [672 B]**

**null\_resource.output\_metadata (remote-exec): Get:33 http://us-east-1.ec2.archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata [116 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 82% [5 Packages store 0 B] [20 Packages**

**null\_resource.output\_metadata (remote-exec): 87% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): Get:34 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en [917 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 88% [5 Packages store 0 B] [34 Translat**

**null\_resource.output\_metadata (remote-exec): Get:35 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1007 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 89% [5 Packages store 0 B] [35 Packages**

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): Get:36 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en [221 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B] [36 Translat**

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): Get:37 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [22.3 kB]**

**null\_resource.output\_metadata (remote-exec): Get:38 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [50.5 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B] [Waiting for**

**null\_resource.output\_metadata (remote-exec): Get:39 http://security.ubuntu.com/ubuntu jammy-security/multiverse Translation-en [10.2 kB]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B] [39 Translat**

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): Get:40 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata [376 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 91% [5 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 92% [Working]**

**null\_resource.output\_metadata (remote-exec): 92% [7 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 92% [7 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 92% [Working]**

**null\_resource.output\_metadata (remote-exec): 92% [8 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 92% [Working]**

**null\_resource.output\_metadata (remote-exec): 92% [9 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): 92% [Working]**

**null\_resource.output\_metadata (remote-exec): 92% [10 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec): 93% [Working]**

**null\_resource.output\_metadata (remote-exec): 93% [11 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 93% [Working]**

**null\_resource.output\_metadata (remote-exec): 93% [12 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 93% [Working]**

**null\_resource.output\_metadata (remote-exec): 93% [13 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 93% [Working]**

**null\_resource.output\_metadata (remote-exec): 93% [14 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 94% [Working]**

**null\_resource.output\_metadata (remote-exec): 94% [6 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 94% [Working]**

**null\_resource.output\_metadata (remote-exec): 94% [16 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 94% [Working]**

**null\_resource.output\_metadata (remote-exec): 94% [15 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 94% [15 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 94% [Working]**

**null\_resource.output\_metadata (remote-exec): 94% [17 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 95% [Working]**

**null\_resource.output\_metadata (remote-exec): 95% [19 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 95% [Working]**

**null\_resource.output\_metadata (remote-exec): 95% [18 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 95% [Working]**

**null\_resource.output\_metadata (remote-exec): 95% [21 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec): 95% [Working]**

**null\_resource.output\_metadata (remote-exec): 95% [22 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 95% [Working]**

**null\_resource.output\_metadata (remote-exec): 95% [23 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): 96% [Working]**

**null\_resource.output\_metadata (remote-exec): 96% [24 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec): 96% [Working]**

**null\_resource.output\_metadata (remote-exec): 96% [25 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 96% [Working]**

**null\_resource.output\_metadata (remote-exec): 96% [26 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): 96% [Working]**

**null\_resource.output\_metadata (remote-exec): 96% [27 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec): 97% [Working]**

**null\_resource.output\_metadata (remote-exec): 97% [28 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 97% [Working]**

**null\_resource.output\_metadata (remote-exec): 97% [29 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 97% [Working]**

**null\_resource.output\_metadata (remote-exec): 97% [30 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): 97% [Working]**

**null\_resource.output\_metadata (remote-exec): 97% [31 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec): 98% [Working]**

**null\_resource.output\_metadata (remote-exec): 98% [32 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 98% [Working]**

**null\_resource.output\_metadata (remote-exec): 98% [33 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 98% [Working]**

**null\_resource.output\_metadata (remote-exec): 98% [20 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 98% [20 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 98% [Working]              6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): 98% [34 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 99% [Working]              6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): 99% [35 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata (remote-exec): 99% [Working]              6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): 99% [36 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec): 99% [Working]              6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): 99% [37 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 99% [Working]              6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): 99% [38 Packages store 0 B]**

**null\_resource.output\_metadata (remote-exec): 100% [Working]             6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): 100% [39 Translation-en store 0 B]**

**null\_resource.output\_metadata (remote-exec): 100% [Working]             6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): 100% [40 Commands-amd64 store 0 B]**

**null\_resource.output\_metadata (remote-exec): 100% [Working]             6457 kB/s 0s**

**null\_resource.output\_metadata (remote-exec): Fetched 41.7 MB in 7s (5940 kB/s)**

**null\_resource.output\_metadata: Still creating... [00m10s elapsed]**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 0%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 0%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 0%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 2%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 2%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 3%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 3%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 3%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 3%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 3%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 3%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 26%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 26%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 32%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 37%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 37%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 37%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 37%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 37%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 37%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 44%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 44%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 48%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 48%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 59%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 59%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 65%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 65%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 68%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 68%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 69%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 75%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 75%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 79%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 79%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 90%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 90%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 90%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 96%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 96%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 98%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 98%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 99%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 99%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 99%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 99%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 99%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 99%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... Done**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 0%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 0%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 0%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 50%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 50%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... Done**

**null\_resource.output\_metadata (remote-exec): Reading state information... 0%**

**null\_resource.output\_metadata (remote-exec): Reading state information... 0%**

**null\_resource.output\_metadata (remote-exec): Reading state information... Done**

**null\_resource.output\_metadata (remote-exec): All packages are up to date.**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 0%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 100%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... Done**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 0%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 0%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 50%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 50%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... Done**

**null\_resource.output\_metadata (remote-exec): Reading state information... 0%**

**null\_resource.output\_metadata (remote-exec): Reading state information... 0%**

**null\_resource.output\_metadata (remote-exec): Reading state information... Done**

**null\_resource.output\_metadata (remote-exec): Calculating upgrade... 0%**

**null\_resource.output\_metadata (remote-exec): Calculating upgrade... 50%**

**null\_resource.output\_metadata (remote-exec): Calculating upgrade... Done**

**null\_resource.output\_metadata (remote-exec): 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 0%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... 100%**

**null\_resource.output\_metadata (remote-exec): Reading package lists... Done**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 0%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 0%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 50%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... 50%**

**null\_resource.output\_metadata (remote-exec): Building dependency tree... Done**

**null\_resource.output\_metadata (remote-exec): Reading state information... 0%**

**null\_resource.output\_metadata (remote-exec): Reading state information... 0%**

**null\_resource.output\_metadata (remote-exec): Reading state information... Done**

**null\_resource.output\_metadata (remote-exec): lsb-release is already the newest version (11.1.0ubuntu4).**

**null\_resource.output\_metadata (remote-exec): lsb-release set to manually installed.**

**null\_resource.output\_metadata (remote-exec): ca-certificates is already the newest version (20240203~22.04.1).**

**null\_resource.output\_metadata (remote-exec): ca-certificates set to manually installed.**

**null\_resource.output\_metadata (remote-exec): curl is already the newest version (7.81.0-1ubuntu1.21).**

**null\_resource.output\_metadata (remote-exec): curl set to manually installed.**

**null\_resource.output\_metadata (remote-exec): gnupg is already the newest version (2.2.27-3ubuntu2.4).**

**null\_resource.output\_metadata (remote-exec): gnupg set to manually installed.**

**null\_resource.output\_metadata (remote-exec): 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.**

**null\_resource.output\_metadata (remote-exec): # Executing docker install script, commit: 8b33a64d28ec86a1121623f1d349801b48f2837b**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c apt-get -qq update >/dev/null**

**null\_resource.output\_metadata: Still creating... [00m20s elapsed]**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c DEBIAN\_FRONTEND=noninteractive apt-get -y -qq install ca-certificates curl >/dev/null**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c install -m 0755 -d /etc/apt/keyrings**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" -o /etc/apt/keyrings/docker.asc**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c chmod a+r /etc/apt/keyrings/docker.asc**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu jammy stable" > /etc/apt/sources.list.d/docker.list**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c apt-get -qq update >/dev/null**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c DEBIAN\_FRONTEND=noninteractive apt-get -y -qq install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-ce-rootless-extras docker-buildx-plugin docker-model-plugin >/dev/null**

**null\_resource.output\_metadata: Still creating... [00m30s elapsed]**

**null\_resource.output\_metadata: Still creating... [00m40s elapsed]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [                ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=               ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==              ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==              ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==              ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==              ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==              ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==              ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==              ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===             ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [====            ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [====            ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [====            ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [====            ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [====            ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [====            ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [====            ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=====           ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [======          ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [======          ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [======          ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [======          ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [======          ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [======          ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [======          ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=======         ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [========        ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=========       ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=========       ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=========       ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=========       ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=========       ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=========       ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=========       ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==========      ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [===========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [============    ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============   ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============   ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============   ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============   ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============   ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============   ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============   ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [==============  ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============== ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============== ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============== ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============== ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============== ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============== ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [=============== ]**

**null\_resource.output\_metadata (remote-exec): Scanning processes... [================]**

**null\_resource.output\_metadata (remote-exec): Scanning processes...**

**null\_resource.output\_metadata (remote-exec): Scanning linux images... [             ]**

**null\_resource.output\_metadata (remote-exec): Scanning linux images... [====         ]**

**null\_resource.output\_metadata (remote-exec): Scanning linux images... [========     ]**

**null\_resource.output\_metadata (remote-exec): Scanning linux images... [=============]**

**null\_resource.output\_metadata (remote-exec): Scanning linux images...**

**null\_resource.output\_metadata (remote-exec): Using systemd to manage Docker service**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c systemctl enable --now docker.service**

**null\_resource.output\_metadata (remote-exec):   UNIT    LOAD   ACTIVE  SUB     DESCRI…**

**null\_resource.output\_metadata (remote-exec):   proc-s… loaded active  running Arbitr…**

**null\_resource.output\_metadata (remote-exec):   dev-lo… loaded activa… tentat… /dev/l…**

**null\_resource.output\_metadata (remote-exec):   dev-lo… loaded activa… tentat… /dev/l…**

**null\_resource.output\_metadata (remote-exec):   dev-lo… loaded activa… tentat… /dev/l…**

**null\_resource.output\_metadata (remote-exec):   dev-lo… loaded activa… tentat… /dev/l…**

**null\_resource.output\_metadata (remote-exec):   dev-lo… loaded activa… tentat… /dev/l…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged Amazon…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged Amazon…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged Amazon…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged Amazon…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged Elasti…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged Amazon…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged /sys/d…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged /sys/d…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged /sys/d…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged /sys/d…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged /sys/d…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged /sys/d…**

**null\_resource.output\_metadata (remote-exec):   sys-de… loaded active  plugged /sys/d…**

**null\_resource.output\_metadata (remote-exec):   sys-mo… loaded active  plugged /sys/m…**

**null\_resource.output\_metadata (remote-exec):   sys-mo… loaded active  plugged /sys/m…**

**null\_resource.output\_metadata (remote-exec):   sys-su… loaded active  plugged /sys/s…**

**null\_resource.output\_metadata (remote-exec):   sys-su… loaded active  plugged Elasti…**

**null\_resource.output\_metadata (remote-exec):   -.mount loaded active  mounted Root M…**

**null\_resource.output\_metadata (remote-exec):   boot-e… loaded active  mounted /boot/…**

**null\_resource.output\_metadata (remote-exec):   dev-hu… loaded active  mounted Huge P…**

**null\_resource.output\_metadata (remote-exec):   dev-mq… loaded active  mounted POSIX …**

**null\_resource.output\_metadata (remote-exec):   proc-s… loaded active  mounted Arbitr…**

**null\_resource.output\_metadata (remote-exec):   run-cr… loaded active  mounted /run/c…**

**null\_resource.output\_metadata (remote-exec):   run-sn… loaded active  mounted /run/s…**

**null\_resource.output\_metadata (remote-exec):   run-sn… loaded active  mounted /run/s…**

**null\_resource.output\_metadata (remote-exec):   run-us… loaded active  mounted /run/u…**

**null\_resource.output\_metadata (remote-exec):   snap-a… loaded active  mounted Mount …**

**null\_resource.output\_metadata (remote-exec):   snap-c… loaded active  mounted Mount …**

**null\_resource.output\_metadata (remote-exec):   snap-c… loaded active  mounted Mount …**

**null\_resource.output\_metadata (remote-exec):   snap-l… loaded active  mounted Mount …**

**null\_resource.output\_metadata (remote-exec):   snap-s… loaded active  mounted Mount …**

**null\_resource.output\_metadata (remote-exec):   sys-fs… loaded active  mounted FUSE C…**

**null\_resource.output\_metadata (remote-exec):   sys-ke… loaded active  mounted Kernel…**

**null\_resource.output\_metadata (remote-exec):   sys-ke… loaded active  mounted Kernel…**

**null\_resource.output\_metadata (remote-exec):   sys-ke… loaded active  mounted Kernel…**

**null\_resource.output\_metadata (remote-exec):   acpid.… loaded active  running ACPI E…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  waiting Dispat…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  waiting Forwar…**

**null\_resource.output\_metadata (remote-exec):   init.s… loaded active  running System…**

**null\_resource.output\_metadata (remote-exec):   sessio… loaded active  running Sessio…**

**null\_resource.output\_metadata (remote-exec):   acpid.… loaded active  running ACPI e…**

**null\_resource.output\_metadata (remote-exec):   apparm… loaded active  exited  Load A…**

**null\_resource.output\_metadata (remote-exec):   apport… loaded active  exited  LSB: a…**

**null\_resource.output\_metadata (remote-exec):   blk-av… loaded active  exited  Availa…**

**null\_resource.output\_metadata (remote-exec):   chrony… loaded active  running chrony…**

**null\_resource.output\_metadata (remote-exec):   cloud-… loaded active  exited  Cloud-…**

**null\_resource.output\_metadata (remote-exec):   cloud-… loaded active  exited  Cloud-…**

**null\_resource.output\_metadata (remote-exec):   cloud-… loaded active  exited  Cloud-…**

**null\_resource.output\_metadata (remote-exec):   cloud-… loaded active  exited  Cloud-…**

**null\_resource.output\_metadata (remote-exec):   consol… loaded active  exited  Set co…**

**null\_resource.output\_metadata (remote-exec):   contai… loaded active  running contai…**

**null\_resource.output\_metadata (remote-exec):   cron.s… loaded active  running Regula…**

**null\_resource.output\_metadata (remote-exec):   dbus.s… loaded active  running D-Bus …**

**null\_resource.output\_metadata (remote-exec):   docker… loaded active  running Docker…**

**null\_resource.output\_metadata (remote-exec):   finalr… loaded active  exited  Create…**

**null\_resource.output\_metadata (remote-exec):   getty@… loaded active  running Getty …**

**null\_resource.output\_metadata (remote-exec):   irqbal… loaded active  running irqbal…**

**null\_resource.output\_metadata (remote-exec):   keyboa… loaded active  exited  Set th…**

**null\_resource.output\_metadata (remote-exec):   kmod-s… loaded active  exited  Create…**

**null\_resource.output\_metadata (remote-exec):   lvm2-m… loaded active  exited  Monito…**

**null\_resource.output\_metadata (remote-exec):   multip… loaded active  running Device…**

**null\_resource.output\_metadata (remote-exec):   networ… loaded active  running Dispat…**

**null\_resource.output\_metadata (remote-exec):   packag… loaded active  running Packag…**

**null\_resource.output\_metadata (remote-exec):   plymou… loaded active  exited  Hold u…**

**null\_resource.output\_metadata (remote-exec):   plymou… loaded active  exited  Termin…**

**null\_resource.output\_metadata (remote-exec):   plymou… loaded active  exited  Tell P…**

**null\_resource.output\_metadata (remote-exec):   polkit… loaded active  running Author…**

**null\_resource.output\_metadata (remote-exec):   rsyslo… loaded active  running System…**

**null\_resource.output\_metadata (remote-exec):   serial… loaded active  running Serial…**

**null\_resource.output\_metadata (remote-exec):   setvtr… loaded active  exited  Set co…**

**null\_resource.output\_metadata (remote-exec):   snap.a… loaded active  running Servic…**

**null\_resource.output\_metadata (remote-exec):   snapd.… loaded active  exited  Load A…**

**null\_resource.output\_metadata (remote-exec):   snapd.… loaded active  exited  Wait u…**

**null\_resource.output\_metadata (remote-exec):   snapd.… loaded active  running Snap D…**

**null\_resource.output\_metadata (remote-exec):   ssh.se… loaded active  running OpenBS…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Set Up…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  File S…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  File S…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Flush …**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Journa…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running User L…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Commit…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Load K…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Wait f…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Networ…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Load/S…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Remoun…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Networ…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Apply …**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Create…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Create…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Create…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Coldpl…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Rule-b…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Record…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  exited  Permit…**

**null\_resource.output\_metadata (remote-exec):   ufw.se… loaded active  exited  Uncomp…**

**null\_resource.output\_metadata (remote-exec):   unatte… loaded active  running Unatte…**

**null\_resource.output\_metadata (remote-exec):   user-r… loaded active  exited  User R…**

**null\_resource.output\_metadata (remote-exec):   user@1… loaded active  running User M…**

**null\_resource.output\_metadata (remote-exec):   -.slice loaded active  active  Root S…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  active  Slice …**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  active  Slice …**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  active  Slice …**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  active  Slice …**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  active  System…**

**null\_resource.output\_metadata (remote-exec):   user-1… loaded active  active  User S…**

**null\_resource.output\_metadata (remote-exec):   user.s… loaded active  active  User a…**

**null\_resource.output\_metadata (remote-exec):   acpid.… loaded active  running ACPID …**

**null\_resource.output\_metadata (remote-exec):   cloud-… loaded active  listen… cloud-…**

**null\_resource.output\_metadata (remote-exec):   dbus.s… loaded active  running D-Bus …**

**null\_resource.output\_metadata (remote-exec):   dm-eve… loaded active  listen… Device…**

**null\_resource.output\_metadata (remote-exec):   docker… loaded active  running Docker…**

**null\_resource.output\_metadata (remote-exec):   iscsid… loaded active  listen… Open-i…**

**null\_resource.output\_metadata (remote-exec):   lvm2-l… loaded active  listen… LVM2 p…**

**null\_resource.output\_metadata (remote-exec):   multip… loaded active  running multip…**

**null\_resource.output\_metadata (remote-exec):   snap.l… loaded active  listen… Socket…**

**null\_resource.output\_metadata (remote-exec):   snap.l… loaded active  listen… Socket…**

**null\_resource.output\_metadata (remote-exec):   snapd.… loaded active  running Socket…**

**null\_resource.output\_metadata (remote-exec):   syslog… loaded active  running Syslog…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  listen… fsck t…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  listen… initct…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Journa…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Journa…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Journa…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running Networ…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  listen… Load/S…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running udev C…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  running udev K…**

**null\_resource.output\_metadata (remote-exec):   uuidd.… loaded active  listen… UUID d…**

**null\_resource.output\_metadata (remote-exec):   basic.… loaded active  active  Basic …**

**null\_resource.output\_metadata (remote-exec):   cloud-… loaded active  active  Cloud-…**

**null\_resource.output\_metadata (remote-exec):   cloud-… loaded active  active  Cloud-…**

**null\_resource.output\_metadata (remote-exec):   crypts… loaded active  active  Local …**

**null\_resource.output\_metadata (remote-exec):   getty-… loaded active  active  Prepar…**

**null\_resource.output\_metadata (remote-exec):   getty.… loaded active  active  Login …**

**null\_resource.output\_metadata (remote-exec):   graphi… loaded active  active  Graphi…**

**null\_resource.output\_metadata (remote-exec):   local-… loaded active  active  Prepar…**

**null\_resource.output\_metadata (remote-exec):   local-… loaded active  active  Local …**

**null\_resource.output\_metadata (remote-exec):   multi-… loaded active  active  Multi-…**

**null\_resource.output\_metadata (remote-exec):   networ… loaded active  active  Networ…**

**null\_resource.output\_metadata (remote-exec):   networ… loaded active  active  Prepar…**

**null\_resource.output\_metadata (remote-exec):   networ… loaded active  active  Network**

**null\_resource.output\_metadata (remote-exec):   nss-lo… loaded active  active  Host a…**

**null\_resource.output\_metadata (remote-exec):   paths.… loaded active  active  Path U…**

**null\_resource.output\_metadata (remote-exec):   remote… loaded active  active  Prepar…**

**null\_resource.output\_metadata (remote-exec):   remote… loaded active  active  Remote…**

**null\_resource.output\_metadata (remote-exec):   slices… loaded active  active  Slice …**

**null\_resource.output\_metadata (remote-exec):   snapd.… loaded active  active  Mounti…**

**null\_resource.output\_metadata (remote-exec):   snapd.… loaded active  active  Mounte…**

**null\_resource.output\_metadata (remote-exec):   socket… loaded active  active  Socket…**

**null\_resource.output\_metadata (remote-exec):   swap.t… loaded active  active  Swaps**

**null\_resource.output\_metadata (remote-exec):   sysini… loaded active  active  System…**

**null\_resource.output\_metadata (remote-exec):   time-s… loaded active  active  System…**

**null\_resource.output\_metadata (remote-exec):   time-s… loaded active  active  System…**

**null\_resource.output\_metadata (remote-exec):   timers… loaded active  active  Timer …**

**null\_resource.output\_metadata (remote-exec):   verity… loaded active  active  Local …**

**null\_resource.output\_metadata (remote-exec):   apt-da… loaded active  waiting Daily …**

**null\_resource.output\_metadata (remote-exec):   apt-da… loaded active  waiting Daily …**

**null\_resource.output\_metadata (remote-exec):   dpkg-d… loaded active  waiting Daily …**

**null\_resource.output\_metadata (remote-exec):   e2scru… loaded active  waiting Period…**

**null\_resource.output\_metadata (remote-exec):   fstrim… loaded active  waiting Discar…**

**null\_resource.output\_metadata (remote-exec):   logrot… loaded active  waiting Daily …**

**null\_resource.output\_metadata (remote-exec):   man-db… loaded active  waiting Daily …**

**null\_resource.output\_metadata (remote-exec):   motd-n… loaded active  waiting Messag…**

**null\_resource.output\_metadata (remote-exec):   system… loaded active  waiting Daily …**

**null\_resource.output\_metadata (remote-exec):   update… loaded active  waiting Downlo…**

**null\_resource.output\_metadata (remote-exec):   update… loaded active  waiting Check …**

**null\_resource.output\_metadata (remote-exec): LOAD   = Reflects whether the unit definition was properly loaded.**

**null\_resource.output\_metadata (remote-exec): ACTIVE = The high-level unit activation state, i.e. generalization of SUB.**

**null\_resource.output\_metadata (remote-exec): SUB    = The low-level unit activation state, values depend on unit type.**

**null\_resource.output\_metadata (remote-exec): 174 loaded units listed. Pass --all to see loaded but inactive units, too.**

**null\_resource.output\_metadata (remote-exec): To show all installed unit files use 'systemctl list-unit-files'.**

**null\_resource.output\_metadata (remote-exec): INFO: Docker daemon enabled and started**

**null\_resource.output\_metadata (remote-exec): + sudo -E sh -c docker version**

**null\_resource.output\_metadata (remote-exec): Client: Docker Engine - Community**

**null\_resource.output\_metadata (remote-exec):  Version:           29.1.3**

**null\_resource.output\_metadata (remote-exec):  API version:       1.52**

**null\_resource.output\_metadata (remote-exec):  Go version:        go1.25.5**

**null\_resource.output\_metadata (remote-exec):  Git commit:        f52814d**

**null\_resource.output\_metadata (remote-exec):  Built:             Fri Dec 12 14:49:37 2025**

**null\_resource.output\_metadata (remote-exec):  OS/Arch:           linux/amd64**

**null\_resource.output\_metadata (remote-exec):  Context:           default**

**null\_resource.output\_metadata (remote-exec): Server: Docker Engine - Community**

**null\_resource.output\_metadata (remote-exec):  Engine:**

**null\_resource.output\_metadata (remote-exec):   Version:          29.1.3**

**null\_resource.output\_metadata (remote-exec):   API version:      1.52 (minimum version 1.44)**

**null\_resource.output\_metadata (remote-exec):   Go version:       go1.25.5**

**null\_resource.output\_metadata (remote-exec):   Git commit:       fbf3ed2**

**null\_resource.output\_metadata (remote-exec):   Built:            Fri Dec 12 14:49:37 2025**

**null\_resource.output\_metadata (remote-exec):   OS/Arch:          linux/amd64**

**null\_resource.output\_metadata (remote-exec):   Experimental:     false**

**null\_resource.output\_metadata (remote-exec):  containerd:**

**null\_resource.output\_metadata (remote-exec):   Version:          v2.2.1**

**null\_resource.output\_metadata (remote-exec):   GitCommit:        dea7da592f5d1d2b7755e3a161be07f43fad8f75**

**null\_resource.output\_metadata (remote-exec):  runc:**

**null\_resource.output\_metadata (remote-exec):   Version:          1.3.4**

**null\_resource.output\_metadata (remote-exec):   GitCommit:        v1.3.4-0-gd6d73eb8**

**null\_resource.output\_metadata (remote-exec):  docker-init:**

**null\_resource.output\_metadata (remote-exec):   Version:          0.19.0**

**null\_resource.output\_metadata (remote-exec):   GitCommit:        de40ad0**

**null\_resource.output\_metadata (remote-exec): ================================================================================**

**null\_resource.output\_metadata (remote-exec): To run Docker as a non-privileged user, consider setting up the**

**null\_resource.output\_metadata (remote-exec): Docker daemon in rootless mode for your user:**

**null\_resource.output\_metadata (remote-exec):     dockerd-rootless-setuptool.sh install**

**null\_resource.output\_metadata (remote-exec): Visit https://docs.docker.com/go/rootless/ to learn about rootless mode.**


**null\_resource.output\_metadata (remote-exec): To run the Docker daemon as a fully privileged service, but granting non-root**

**null\_resource.output\_metadata (remote-exec): users access, refer to https://docs.docker.com/go/daemon-access/**

**null\_resource.output\_metadata (remote-exec): WARNING: Access to the remote API on a privileged Docker daemon is equivalent**

**null\_resource.output\_metadata (remote-exec):          to root access on the host. Refer to the 'Docker daemon attack surface'**

**null\_resource.output\_metadata (remote-exec):          documentation for details: https://docs.docker.com/go/attack-surface/**

**null\_resource.output\_metadata (remote-exec): ================================================================================**

**null\_resource.output\_metadata (remote-exec): Synchronizing state of docker.service with SysV service script with /lib/systemd/systemd-sysv-install.**

**null\_resource.output\_metadata (remote-exec): Executing: /lib/systemd/systemd-sysv-install enable docker**

**null\_resource.output\_metadata (remote-exec):   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current**

**null\_resource.output\_metadata (remote-exec):                                  Dload  Upload   Total   Spent    Left  Speed**

**null\_resource.output\_metadata (remote-exec):   0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0**

**null\_resource.output\_metadata (remote-exec):   0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0**

**null\_resource.output\_metadata (remote-exec):   0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0**

**null\_resource.output\_metadata (remote-exec): 100 29.8M  100 29.8M    0     0  73.6M      0 --:--:-- --:--:-- --:--:-- 73.6M**

**null\_resource.output\_metadata (remote-exec): services:**

**null\_resource.output\_metadata (remote-exec):   jenkins:**

**null\_resource.output\_metadata (remote-exec):     image: jenkins/jenkins:lts**

**null\_resource.output\_metadata (remote-exec):     container\_name: jenkins**

**null\_resource.output\_metadata (remote-exec):     restart: unless-stopped**

**null\_resource.output\_metadata (remote-exec):     ports:**

**null\_resource.output\_metadata (remote-exec):       - '8080:8080'**

**null\_resource.output\_metadata (remote-exec):       - '50000:50000'**

**null\_resource.output\_metadata (remote-exec):     volumes:**

**null\_resource.output\_metadata (remote-exec):       - jenkins\_home:/var/jenkins\_home**

**null\_resource.output\_metadata (remote-exec): volumes:**

**null\_resource.output\_metadata (remote-exec):   jenkins\_home:**

**[+] up 0/1rce.output\_metadata (remote-exec):** 

**[+] up 0/1rce.output\_metadata (remote-exec):  ⠋ Image jenkins/jenkins:lts Pulling 0.1s** 

**[+] up 0/1rce.output\_metadata (remote-exec):  ⠙ Image jenkins/jenkins:lts Pulling 0.2s** 

**[+] up 5/13ce.output\_metadata (remote-exec):  ⠼ Image jenkins/jenkins:lts Pulling 0.5s** 

**[+] up 12/14e.output\_metadata (remote-exec):  ⠧ Image jenkins/jenkins:lts [⣿⠀⠀⠀⣿⣿⠀⣿⠀⠀⣿⣿] Pulling 0.8s** 

**[+] up 12/14e.output\_metadata (remote-exec):  ⠋ Image jenkins/jenkins:lts [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿] 277.9MB / 293.3MB Pulling 4.1s** 

**[+] up 12/14e.output\_metadata (remote-exec):  ⠸ Image jenkins/jenkins:lts [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿] 277.9MB / 293.3MB Pulling 4.4s** 

**[+] up 14/14e.output\_metadata (remote-exec):  ⠴ Image jenkins/jenkins:lts [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿] 277.9MB / 293.3MB Pulling 7.6s** 

**[+] up 17/17e.output\_metadata (remote-exec):  ✔ Image jenkins/jenkins:lts Pulled 8.6s ⣿⣿] 277.9MB / 293.3MB Pulling 8.5s** 

**null\_resource.output\_metadata (remote-exec):  ✔ Image jenkins/jenkins:lts   Pulled 8.6s 0.2s .2s 239MB0.4s** 

**null\_resource.output\_metadata (remote-exec):    ✔ d2519f76d4c6              Pull complete 0.2s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 13cc39f8244a              Pull complete 3.6s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 5687d4df0728              Pull complete 5.8s s .32MB2.3s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 2f1ecb09fa36              Pull complete 6.0s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 68cdef480092              Pull complete 0.2s s 29MB0.5s** 

**null\_resource.output\_metadata (remote-exec):    ✔ e0e73f34dee9              Pull complete 0.2s s .05MB2.1s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 687044b042c5              Pull complete 6.7s s 293kB0.2s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 501deb283b89              Pull complete 0.2s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ a9230f7c9c31              Pull complete 6.9s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ d7dd2e630238              Pull complete 8.0s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 3fb70446889e              Pull complete 0.3s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 986be6969b0a              Pull complete 0.2s s** 

**null\_resource.output\_metadata (remote-exec):    ✔ 8d32d2b88383              Download complete 0.0s** 

**null\_resource.output\_metadata (remote-exec):  ✔ Network jenkins\_default     Created 0.1s** 

**null\_resource.output\_metadata (remote-exec):  ✔ Volume jenkins\_jenkins\_home Created 0.0s** 

**null\_resource.output\_metadata (remote-exec):  ✔ Container jenkins           Created 0.3s**  

**null\_resource.output\_metadata (remote-exec):** 

**null\_resource.output\_metadata: Provisioning with 'local-exec'...**

**null\_resource.output\_metadata (local-exec): Executing: ["/bin/sh" "-c" "echo jenkins EC2 PUBLIC\_IP: 34.194.90.154 - jenkins EC2 PUBLIC\_DNS: ec2-34-194-90-154.compute-1.amazonaws.com  >> jenkins\_ec2.txt"]**

**null\_resource.output\_metadata: Creation complete after 56s [id=4422847760235372374]**

**Apply complete! Resources: 16 added, 0 changed, 0 destroyed.**




Vue sur la console AWS de l’infrastructure générée via Terraform :




![](Aspose.Words.3fa145c5-d83c-4906-be38-c7d3d022d667.001.jpeg)














Nous voyons bien les règles de la SecurityGroup attaché à notre EC2 ainsi les EBS :

![](Aspose.Words.3fa145c5-d83c-4906-be38-c7d3d022d667.002.jpeg)


![](Aspose.Words.3fa145c5-d83c-4906-be38-c7d3d022d667.003.jpeg)








Test fonctionnel de l’URL (ElasticIP sur le port d’écoute 8080) prouvant le bon déploiement du conteneur Jenkins :



![](Aspose.Words.3fa145c5-d83c-4906-be38-c7d3d022d667.004.jpeg)




