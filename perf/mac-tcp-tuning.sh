
#http://slaptijack.com/system-administration/mac-os-x-tcp-performance-tuning/
#http://rolande.wordpress.com/2014/05/17/performance-tuning-the-network-stack-on-mac-os-x-part-2/

# windows   http://kb.globalscape.com/KnowledgebaseArticle10438.aspx
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters

#http://technet.microsoft.com/en-us/magazine/2007.01.cableguy.aspx
#http://en.wikipedia.org/wiki/TCP_tuning

# execute these commands on mac os x to allow for more sockets, send and receive buffers
sysctl -w net.inet.tcp.rfc1323=1

sysctl -w kern.ipc.somaxconn=2048
sysctl -w net.inet.tcp.win_scale_factor=4

sysctl -w kern.ipc.maxsockbuf=6290000 

sysctl -w net.inet.tcp.sendspace=3000000
sysctl -w net.inet.tcp.recvspace=3000000 


#windows settings
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global autotuninglevel=normal
