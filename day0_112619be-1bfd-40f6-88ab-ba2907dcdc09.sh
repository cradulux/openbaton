#cloud-config
groups:
  - users
system_info:
 default_user:
  name: ubuntu
  lock_passwd: true
  groups: users
 sudo: ["ALL=(ALL) NOPASSWD:ALL"]
password: ubuntu
chpasswd: { expire: False }
ssh_pwauth: True
