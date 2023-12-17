docker run -d --name <runner-container-name> \
    -e RUNNER_NAME=<runner-name> \
    -e GITHUB_ACCESS_TOKEN=<github-access-token> \
    -e RUNNER_REPOSITORY_URL=https://github.com/<username>/<repo-name> \
    -v /var/run/docker.sock:/var/run/docker.sock \
    tcardonne/github-runner
