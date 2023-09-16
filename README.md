# GitHub Actions

## This is a Spring Boot Rest API. I'm trying here to run a _CI/CD_ pipeline starting from building the docker image till deploying the container to _AWS EC2_ instance every time I push updates to the master branch. Here are the steps:
### _Continuous Integration (CI):_
- Checkout code.
- Login to dockerhub.
- Build docker image that contains the Spring Boot Rest API and tag it with the commit sha.
- Push the docker image to dockerhub.
### _Continuous Deployment (CD):_
- Stop running docker containers.
- Delete existing docker images.
- Pull docker image that contains the Spring Boot Rest API.
- Run docker container and expose port _8080_.


## Getting Started
### Setup AWS EC2 Runner
```shell
# Download
# Create a folder
$ mkdir actions-runner && cd actions-runner# Download the latest runner package
$ curl -o actions-runner-linux-x64-2.309.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz# Optional: Validate the hash
$ echo "2974243bab2a282349ac833475d241d5273605d3628f0685bd07fb5530f9bb1a  actions-runner-linux-x64-2.309.0.tar.gz" | shasum -a 256 -c# Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.309.0.tar.gz
# Configure
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/omarhosny206/github-actions --token AN5PJP2TJDG37WBGSXABH4DFAWVCW# Last step, run it!
$ ./run.sh
```

### AWS EC2 Runner Service
```shell
# to enable the ec2 instance to listen to the jobs triggered by the workflow.
sudo micro /etc/systemd/system/github-runner.service

# Content of the file
[Unit]
Description=GitHub Actions Self-hosted Runner
After=network.target

[Service]
WorkingDirectory=/home/ubuntu/actions-runner
ExecStart=/home/ubuntu/actions-runner/run.sh
Restart=always
Environment="RUNNER_ALLOW_RUNASROOT=1"  # Add this line if required

[Install]
WantedBy=multi-user.target
# End of file's content

# then run
sudo systemctl enable github-runner
sudo systemctl start github-runner
sudo systemctl status github-runner.service
```
