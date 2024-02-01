docker run -d --name <container_name> \
    -e GITHUB_USERNAME=<github_username> \
    -e GITHUB_REPOSITORY=<github_repo_name> \
    -e GITHUB_PERSONAL_ACCESS_TOKEN=<github_pat> \
    -e RUNNER_NAME=<runner_name> \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/bin/docker:/usr/bin/docker \
    omarhosny102/github-runner
