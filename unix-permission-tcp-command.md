# Unix permission -
"rwx" means the directory's owner can list its contents, create new files within it, and descend into it
"r-x" means members of the directory's group can list its contents and descend into it
"r-x" means other users can list the directory's contents and descend into it

https://ss64.com/bash/syntax-permissions.html
sudo find /path/to/Dir -type f -print0 | xargs -0 sudo chmod 644

# Dump TCP logs - 

1. capture from specific interface:
   
   tcpdump -i eth0
2. capture only N number of packets:
   
   tcpdump -c 5 -i eth0

3. Print capture packets in ASCII:

   tcpdump -A -i eth0

4. Display available interface:

   tcpdump -D

5. Display packet in HEX and ASCII:

   tcpdump -XX -i eth0

6. capture and save packets in a file:

   tcpdump -w 0001.pcap -i eth0

7. read captured packets:

   tcpdump -r 0001.pcap

8. capture IP address packets:

   tcpdump -n -i eth0

9. capture only TCP packets:

   tcpdump -i eth0 tcp

10. capture packets from specific port:

    tcpdump -i eth0 port 22

11. capture packets from source IP:

    tcpdump -i eth0 src 10.197.22.13

12. capture packets from dst IP:
    
    tcpdump -i eth0 dst 10.197.22.13

# Size of files in the current directory

   du -sh * | sed -e 's/\t/|/g' | sort -h -r

