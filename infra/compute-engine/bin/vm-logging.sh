#! /bin/bash
echo "Installing Apache Server..."
sudo yum -y install httpd
sudo systemctl start httpd
echo "Hello from us-central1" > /var/www/html/index.html

echo "Installing Monitoring Agent..."
sudo curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh
sudo yum -y install stackdriver-agent
sudo service stackdriver-agent start
# Log Directory: /var/log/syslog (or) /var/log/messages

echo "Installing Logging Agent..."
sudo curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh --also-install
sudo service google-fluentd start

# Create new configuration files in the additional configuration directory -
# Config Directory: /etc/google-fluentd/config.d
# Log Directory: /var/log/google-fluentd/google-fluentd.log
configfiles=("test-unstructured-log" "test-unstructured-log02")

for file in "${configfiles[@]}"
do
    echo "sudo tee /etc/google-fluentd/config.d/${file}.conf <<EOF
    <source>
        @type tail
        <parse>
            # 'none' indicates the log is unstructured (text).
            @type none
        </parse>
        # The path of the log file.
        path /tmp/${file}.log
        # The path of the position file that records where in the log file
        # we have processed already. This is useful when the agent
        # restarts.
        pos_file /var/lib/google-fluentd/pos/${file}.pos
        read_from_head true
        # The log tag for this log input.
        tag ${file}
    </source>
    EOF" > /etc/google-fluentd/config.d/${file}.conf
done

sudo service google-fluentd restart
