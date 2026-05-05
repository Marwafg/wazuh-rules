#!/bin/bash
echo "Deploying fixed rules..."
sudo cp /tmp/fixed_rules/*.xml /var/ossec/etc/rules/
echo "Testing syntax..."
sudo /var/ossec/bin/wazuh-analysisd -t 2>&1 | grep -E "ERROR|CRITICAL|WARNING"
echo "Done. If no errors above, run: sudo systemctl start wazuh-manager"
