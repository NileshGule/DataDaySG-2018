# DataDaySG-2018

Code for [Singapore Data Day 2018 30 June 2018](https://www.meetup.com/mssgug/events/251396654/) demo for `Running containerized database using SQL Server 2017 Linux in Docker containers`

## Code organization
- `Docker`
Contains the docker-compose file

- `k8s`
Contains the Kubernetes manifest files

- `Powershel`
Contains the Powershell scripts for AKS cluster creation, deployment of application and tearing down resources

- `src`
Contains the source code.
    
    - `TechTalksAPI` contains code for Web API project

    - `TechTalksDB` contains database initialization script
