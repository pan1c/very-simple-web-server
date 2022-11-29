# very-simple-web-server

Synopsis
----------

This terraform code will deploy google cloud storage bucket, and configure it to act as a web server for index.html  
It can be deployed only in google cloud  

Prerequisites
----------

- You need to have GCP project
- Clone repo
- Configure your gcloud context for terraform
- Create bucket to store statefile

Installing
----------
 - Create file 
```
provider "google" {
    project  = "{{PROJECT GCP ID}}"
}

```
 - Adjust variables.tf with your "statefiles bucket" name
 - Adjust backend.tf with your "website bucket" name
 - Run terraform commands
```
terrafrom init
terrafrom plan
terrafrom apply
```

Updating
----------
 - Update website/index.html to change index.html
 - Run terrform apply

```
terrafrom apply
```

Check the result
----------
Check https://storage.googleapis.com/ {{bucket name}} /index.html  
e.g https://storage.googleapis.com/very_test_bucket/index.html

