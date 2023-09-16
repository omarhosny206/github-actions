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
```text
visit https://github.com/<username>/<repo-name>/settings/actions/runners
click "New self-hosted runner"
choose runner image & architecture from the options macOS, Linux and Windows.
follow the commands
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
