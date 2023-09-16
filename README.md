# github-actions

## Setup Runner
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

## Runner Service
```shell
sudo micro /etc/systemd/system/github-runner.service

# Content
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
```
