# CARA MEMBUAT USER ROOT VPS
## *Langkah Pertama masuk ke mode `root`.*
* Salin cmd ini 👇 <pre><code>sudo su</code></pre>

## *Langkah Kedua buat password `root`*
* Salin cmd ini 👇 <pre><code>passwd root</code></pre>
* masukkan password
* konfirmasi password

## *Langkah ketiga ubah `sshd_config`.*
* Salin cmd ini 👇 <pre><code>nano /etc/ssh/sshd_config</code></pre>
* Scroll ke bawah ubah `#PermitRootLogin prohibit-password` menjadi `PermitRootLogin yes`
* Scroll ke bawah ubah `#PasswordAuthentication yes` menjadi `PasswordAuthentication yes` lalu simpan (ctrl + O).

## *Terakhir restart service sshd*
* Salin cmd ini 👇 <pre><code>service sshd restart</pre></code>

## *Coba login dengan user root dan password yang kamu buat*
