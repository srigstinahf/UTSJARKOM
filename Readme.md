**Nama: Sri Gustinah Fauziah**<br>
**NIM: 20220801012**<br>
**Fakultas/Prodi: Ilmu Komputer/Teknik Informatika**

1. **Jelaskan menurut anda apa itu Routing Static?**

jawaban: Routing static adalah routing yang dilakukan secara manual, dimana pengelola melakukan konfigurasi secara manual. Dari pengaturan subnet mask, default gateaway hingga pengaturan jaringan yang ingin dituju dilakukan secara manual.
Ingin melakukan routing static maka konfigurasinya dapat seperti ini:
- Masuk ke dalam winbox
- Tambahkan IP Address misal 192.168.10.1/24
- Selanjutnya pada menu IP pilih Routes
- Tambahkan Routes yang ingin dituju seperti destination address: 192.168.20.0/24 serta gateaway diisi dengan IP 192.168.10.1 untuk keluar dari jaringan tersebut ke jaringan lain.
- Setelah itu simpan konfigurasi.
2. **Jelaskan menurut anda apa itu Routing dynamic?**

jawab: Routing dynamic adalah routing yang dilakukan oleh router dengan membuat jalur jaringan yang ingin dituju secara otomatis sesuai dengan pengaturan yang dibuat. 

Tata cara melakukan routing dynamic:

Konfigurasi pada mikrotik 1:
-	Tambahkan IP address baru 192.168.10.1/24 interface 1 dan tambah IP address 20.20.20.1/30 interface 2
-	Pilih menu routing lalu pilih RIP
-	Tambahkan new RIP interface seperti interface ether 2, receive: v1-2, send v2 lalu klik OK
-	selanjutnya tambahkan RIP network baru dengan address 20.20.20.0/30 lalu klik OK
-	Lalu new interface dengan interface ether1, receive v1-2, send v2 lalu klik OK
-   Lalu tambahkan new RIP network dengan address 192.168.10.0/24 klik OK
-	Untuk memeriksa, buka routes di bagian RIP untuk melihat rute yang terhubung
-	Atur dhcp server dengan melakukan dhcp setup pada ether 1
-	Lalu ke cmd (command prompt) ketik ipconfig untuk melihat konfigurasi IP
-	Lakukan ping pada 20.20.20.2 (IP pc lain) dan ping pada 192.168.20.254 (IP pc lain). Jika ada reply maka sudah berhasil.

Konfigurasi pada mikrotik 2:
-	Tambahkan IP address baru 192.168.20.1/24 interface 1 dan tambah IP address 20.20.20.1/30 interface 2 
-	Pilih menu routing lalu pilih RIP
-	Tambahkan new RIP interface seperti interface ether 1, receive: v1-2, send v2 lalu klik OK
-	Lalu tambahkan new RIP network dengan address 192.168.20.0/24 klik OK
-	Tambahkan new RIP interface seperti interface ether 2, receive: v1-2, send v2 lalu klik OK
-	selanjutnya tambahkan RIP network baru dengan address 20.20.20.0/30 lalu klik OK
-	Untuk memeriksa, buka routes di bagian RIP untuk melihat rute yang terhubung
-	Atur dhcp server dengan melakukan dhcp setup pada ether 1
-	Lalu ke cmd (command prompt) ketik ipconfig untuk melihat konfigurasi IP
-	Lakukan ping pada 20.20.20.1 (IP pc lain) dan ping pada 192.168.10.254 (IP pc lain). Jika ada reply maka sudah berhasil.
3. **Jelaskan menurut anda apa itu Firewall?**

jawab: Firewall digunakan untuk mengatur network mana saja yang boleh mengakses dan tidak boleh diakses, mengatur port mana saja yang bisa masuk dan keluar melewati router untuk melindungi jaringan.

4. **Jelaskan menurut anda apa itu NAT?**

jawab: NAT atau Network Address Translation digunakan untuk mentranslate IP local agar dapat mengakses IP public pada jaringan. 
Settingan NAT pada mikrotik:
- Masuk ke dalam winbox 
- Lalu membuat IP address 192.168.1.1/24 pada interface ether1
- Set dhcp pada ether 1 setelah itu buka cmd (command promt) dan lakukan ipconfig untuk mendapatkan IP pc
- pilih menu IP lalu ke Firewall dan pilih bagian NAT
- Di dalam NAT bagian general, chain diisi srcnat, dst address diisi 192.168.2.254 (IP PC lain), protocol diisi 6tcp, dst.port diisi 80.
- lalu pada bagian action, pada action pilih masquerade, log prefix: 192.168.2.1/24 (IP Router lain), to ports: 8000
- Setelah semuanya sudah di setting klik apply lalu OK
- Lakukan langkah di atas pada PC lain dan sesuaikan IP-nya.

**SOAL CASE**

Analisis: topologi tersebut menggambarkan penggunaan ISP sebagai pengganti IP publik untuk menghubungkan tiga lokasi yang masing-masing memiliki perangkat Mikrotik. Setiap lokasi terhubung melalui konfigurasi jaringan berbasis tunnel, memungkinkan komunikasi yang aman melalui internet yang disediakan ISP.

Langkah awal dalam proses ini adalah konfigurasi dasar pada setiap Mikrotik di lokasi KJ, CR, dan KHI. Masing-masing perangkat diberikan IP lokal untuk jaringan internal serta IP publik dari ISP untuk akses internet. DHCP Server diaktifkan di setiap Mikrotik agar perangkat di jaringan lokal dapat menerima IP secara otomatis, sementara NAT diaktifkan agar mereka dapat mengakses internet melalui IP publik.

Tunnel dibangun di antara Mikrotik di setiap lokasi dan diarahkan ke ISP. Contohnya, Mikrotik di lokasi KJ membuat tunnel menuju ISP, begitu pula di lokasi CR dan KHI. Dengan begitu, data dapat mengalir langsung dari satu lokasi ke lokasi lain karena endpoint tunnel diarahkan ke IP publik yang disediakan oleh ISP.

Setiap Mikrotik juga dikonfigurasi dengan routing statis untuk mengatur lalu lintas ke lokasi lain. Dengan konfigurasi ini, perangkat di lokasi KJ, CR, dan KHI dapat saling berkomunikasi. Dalam hal ini, ISP berfungsi sebagai penyedia IP publik, sementara tunneling dan enkripsi memastikan komunikasi antar-lokasi berjalan dengan aman dan efisien.
