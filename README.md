The idea behind this project is to build out a rudimentary CI/CD pipeline to automate updates made to the HTML resume in this repository.

5-18-2020:
The front-end of this project is complete but will continue to be updated accordingly. The simple HMTL resume and associated stylesheet is hosted in an AWS S3 bucket configured to host a static website, behind AWS CloudFront.

I've automated deployment of the resume' as updates are made locally and pushed to GitHub using a simple YAML script to sync pushes to the S3 bucket and clear the CloudFront cache.