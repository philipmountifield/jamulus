echo "Blocking session data"
sudo iptables -I FORWARD 1 -p udp --dport 22124 -j DROP
echo "Waiting for connection timeout (when reaper session is added)"
sleep 30
echo "Allowing session data again"
sudo iptables -D FORWARD 1
echo "All done, you should have a new recording session now"
