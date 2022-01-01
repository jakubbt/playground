<p align="center" style="margin-bottom: 60px">
  <img width="350" height="auto" src="banner.png" alt="Sample app banner">
</p>

# Personal playground for containers and worklofws

The purpose of this app is to run only 🏃‍♂️

## Inscription

First of all, I need to thank to my friend, unvoluntary mentor and the greatest CTO of all times [Juffalow](https://github.com/juffalow) for starting all this mess in my head. Thank you, stay awesome! 🥳
*Don't forget to visit him and give him some ⭐️.*

## Let's start

### What we need?

- Installed `node` and `npm`
- Docker desktop app
- High amount of motivation and patience

### Install

1. Clone Repository
2. run `npm install` in backend and frontend
3. make sure your docker desktop is running
4. fill in docker credentials either in your repo secrets or in workflows env
5. run `docker-compose up` in the root
6. app should be running
7. Play with setup

### Run in cloud (Azure)

1. Login to azure account `az login`
2. Set subscription which should be used `az account set --subscription "<subscription_id_or_subscription_name>"`
3. Create service principal `az ad sp create-for-rbac --name <service_principal_name>`
 - this will return credentials which are available only after this command, you cannot get back to them later, so save them to safe place
 - use credentials in `terraform.aut.tfvars`
4. Create ssh key pair if you don't have one
5. In terraform directory run `terraform init`
6. Run `terraform plan` to see changes which are going to be applied
7. Run `erraform apply` to apply changes

This will create **resource group (test-aks) -> kubernetes cluster (test) -> secret for images -> deployments (frontend + backend) -> services -> ingress nginx controller**, and you will be able to use external ip of ccontroller service from azure portal.