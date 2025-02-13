`Intermediate level question`

# **1.Which command is used for mount and unmount in Linux?**

Mounting và Unmounting là những tác vụ thiết yếu trong bất kỳ Hệ điều hành Linux nào. Nó cho phép người dùng truy cập và quản lý các hệ thống tệp trên nhiều thiết bị lưu trữ khác nhau.Trong đó 
- `Mounting` là quá trình gắn thiết bị lưu trữ hoặc phân vùng vào thư mục hoặc điểm gắn kết để người dùng hệ thống máy tính có thể truy cập và quản lý nội dung của nó
- `Unmounting` là quá trình thiết bị lưu trữ hoặc phân vùng được tách khỏi hệ thống máy tính. Quá trình này khiến nội dung của thiết bị hoặc phân vùng không thể truy cập được nữa cho đến khi được gắn lại vào hệ thống máy tính

 *Việc `mounting` và `unmounting` thường yêu cầu quyền sudo

Cách sử dụng câu lệnh `mount` và `umount`

## Mount
- Tạo một `mount point` (Không nhất thiết mount point phải nằm trong thư mục /mnt. Trong Linux, mount point có thể nằm ở bất kỳ đâu trong hệ thống tệp, miễn là đó là một thư mục trống)
```
mkdir /mnt/usb
```

- Sử dụng lệnh `mount` để gắn phân vùng vào `mount point`
```
sudo mount /dev/sdb1 /mnt/usb
```

Lưu Ý: Mount Point trở thành "Root" của thiết bị gắn kết. Khi gắn kết một thiết bị vào thư mục (ví dụ /mnt/usb), nội dung của thiết bị đó sẽ được hiển thị như thể nó là hệ thống tệp "Root" tại điểm gắn kết đó. "Root" của thiết bị nghĩa là thư mục gốc `/` của thiết bị sẽ trùng với thư mục gắn kết trong hệ thống

- Xác minh xem thư mục được gắn kết bằng lệnh 
```
df-h
```

- Có thể chỉnh sửa file `/etc/fstab` để tự động gắn kết ổ đĩa hoặc thiết bị khi khởi động bằng cách thêm dòng này 
```
<thiết_bị> <điểm_gắn_kết> <loại_hệ_thống_tệp> <tùy_chọn> <dump> <pass>
```
  - thiết_bị: Tên thiết bị hoặc UUID của thiết bị (khuyến khích dùng UUID để ổn định).
  - điểm_gắn_kết: Thư mục để gắn kết thiết bị.
  - loại_hệ_thống_tệp: Kiểu hệ thống tệp (như ext4, ntfs, vfat).
  - tùy_chọn: Các tùy chọn gắn kết (ví dụ defaults, ro, rw).
  - dump: Cài đặt sao lưu (0 hoặc 1, thường là 0).
  - pass: Kiểm tra lỗi hệ thống tệp (0 = bỏ qua, 1 = kiểm tra root trước, 2 = kiểm tra các thiết bị khác).

## Unmount
Lưu ý: Không viết sai lệnh ! Chỉ có `umount` không có `unmount`.

- Sử dụng câu lệnh sau:
```
sudo umount <device|directory>
```
Lưu ý: Trước khi dùng `umount`, cần đảm bảo rằng không có tiến trình nào đang sử dụng thư mục hoặc tệp trong thiết bị. Nếu không, việc tháo gỡ sẽ bị từ chối.Hoặc chúng ta có thể làm cấc cách sau:

- Liệt kê các tập tin đang mở
```
lsof +f -- drive_name
```

- Buộc phải tháo thiết bị nhưng sẽ thực hiện ngắt kết nối chậm, ngắt ổ đĩa ngay lập tức nhưng dọn sạch các tham chiếu khi ổ đĩa không còn sử dụng nữa
```
sudo umount -l drive_name
```

# **2.If your Linux system has some network problems, what components and which commands can be used to troubleshoot in this case?**

Máy tính thường được kết nối với nhau trên mạng. Chúng gửi yêu cầu cho nhau dưới dạng các gói tin đi từ máy chủ đến đích. Linux cung cấp nhiều lệnh khác nhau từ cấu hình mạng và xử lý sự cố.Dưới đây là một số câu lệnh tham khảo:

## ping Command

Lệnh `ping` được sử dụng để đảm bảo rằng máy tính có thể giao tiếp với một thiết bị được chỉ định qua mạng. Lệnh `ping` gửi các thông điệp Yêu cầu phản hồi của Control Message Protocol (ICMP) dưới dạng các gói tin đến máy tính đích và chờ để nhận được phản hồi. Khi các gói tin được máy tính đích nhận được, nó bắt đầu gửi các gói tin trở lại. Lệnh này tiếp tục thực thi cho đến khi bị ngắt. 


Lệnh `ping` cung cấp thông tin chi tiết như 

- Số lượng gói tin được truyền đi.
- Số lượng gói tin nhận được.
- Thời gian để gói tin trả về.


Lệnh `ping` thường được sử dụng cho các mục đích sau:

- Đo thời gian các gói tin trả về để xác định tốc độ kết nối.
- Để đảm bảo rằng kết nối mạng giữa máy chủ và máy tính đích có thể được thiết lập.

```
nickynguyen1910@Nicky:~$ ping facebook.com
PING facebook.com (157.240.199.35) 56(84) bytes of data.
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=1 ttl=54 time=27.7 ms
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=2 ttl=54 time=57.2 ms
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=3 ttl=54 time=30.1 ms
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=4 ttl=54 time=23.8 ms
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=5 ttl=54 time=26.1 ms
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=6 ttl=54 time=25.5 ms
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=7 ttl=54 time=25.2 ms
64 bytes from edge-star-mini-shv-01-hkg4.facebook.com (157.240.199.35): icmp_seq=8 ttl=54 time=30.4 ms
^C
--- facebook.com ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7032ms
rtt min/avg/max/mdev = 23.763/30.718/57.180/10.236 ms
```

## nslookup Command 

Lệnh `nslookup` truy vấn DNS để lấy địa chỉ IP hoặc tên miền từ các DNS records 

```
nickynguyen1910@Nicky:~$ nslookup facebook.com
Server:         10.255.255.254
Address:        10.255.255.254#53

Non-authoritative answer:
Name:   facebook.com
Address: 157.240.199.35
Name:   facebook.com
Address: 2a03:2880:f15e:83:face:b00c:0:25de
```

## traceroute Command

Lệnh `traceroute` được sử dụng để lấy tuyến đường của một gói tin. Nói cách khác, lệnh `traceroute` được sử dụng để xác định đường đi của một gói tin. Nó cũng trả về số lượng các bước nhảy mà gói tin đã thực hiện để đến đích. Lệnh này in ra bảng điều khiển danh sách các máy chủ mà gói tin đi qua để đến đích

```
nickynguyen1910@Nicky:~$ traceroute facebook.com
traceroute to facebook.com (157.240.199.35), 30 hops max, 60 byte packets
 1  Nicky.mshome.net (172.30.240.1)  1.040 ms  0.988 ms  0.967 ms
 2  192.168.1.1 (192.168.1.1)  8.746 ms  2.891 ms  2.873 ms
 3  113.22.0.124 (113.22.0.124)  10.495 ms  10.477 ms  14.642 ms
 4  42.112.2.211 (42.112.2.211)  5.380 ms 42.112.2.97 (42.112.2.97)  9.643 ms  9.592 ms
 5  42.112.2.192 (42.112.2.192)  14.079 ms 42.112.2.250 (42.112.2.250)  14.089 ms  14.060 ms
 6  42.112.2.251 (42.112.2.251)  13.991 ms  7.042 ms 42.112.2.193 (42.112.2.193)  3.246 ms
 7  118.69.249.26 (118.69.249.26)  19.924 ms  19.622 ms 1.53.123.84 (1.53.123.84)  10.609 ms
 8  118.69.249.26 (118.69.249.26)  23.001 ms  20.884 ms  24.983 ms
 9  po207.asw02.hkg4.tfbnw.net (157.240.118.164)  23.837 ms po203.asw02.hkg1.tfbnw.net (157.240.125.172)  25.267 ms ae14.pr04.hkg1.tfbnw.net (157.240.68.66)  28.159 ms
10  po207.asw02.hkg4.tfbnw.net (157.240.118.164)  23.907 ms psw03.hkg4.tfbnw.net (129.134.62.49)  24.376 ms po203.asw01.hkg1.tfbnw.net (157.240.125.164)  23.051 ms
11  psw03.hkg4.tfbnw.net (129.134.62.49)  24.555 ms msw1ad.01.hkg4.tfbnw.net (129.134.82.103)  27.931 ms msw1an.01.hkg4.tfbnw.net (129.134.94.128)  25.580 ms
12  msw1at.01.hkg4.tfbnw.net (129.134.82.33)  27.920 ms msw1ad.01.hkg4.tfbnw.net (129.134.82.103)  28.760 ms *
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  * * *
28  * * *
29  * * *
30  * * *
```

## host Command

Lệnh `host` được sử dụng để tìm tên miền liên kết với địa chỉ IP hoặc tìm địa chỉ IP liên kết với tên miền. Địa chỉ IP trả về là IPv4 hoặc IPv6

```
nickynguyen1910@Nicky:~$ host google.com
google.com has address 142.250.198.46
google.com has IPv6 address 2404:6800:4005:825::200e
google.com mail is handled by 10 smtp.google.com.
```

**Khác nhau giữa `nslookup` và `host`**


| | nslookup | host |
|--|--|--|
| Hiển thị máy chủ DNS | Có hiển thị máy chủ và địa chỉ IP DNS | Không hiển thị |
| Thông tin chi tiết |	Hiển thị địa chỉ IPv4 và IPv6 |	Hiển thị địa chỉ IPv4, IPv6, và bản ghi MX |
| Độ tin cậy	| Cho biết câu trả lời có phải từ DNS chính xác hay không |	Không hiển thị thông tin độ tin cậy |
| Định dạng kết quả |	Chi tiết, dạng liệt kê nhiều dòng |	Ngắn gọn, trực quan hơn |
| Sử dụng khi nào |	Khi cần chẩn đoán và kiểm tra sâu về DNS |	Khi cần tra cứu nhanh thông tin DNS cơ bản |

## netstat Command

`netstat` là lệnh được sử dụng để hiển thị bảng định tuyến, thông tin kết nối, trạng thái của các cổng, v.v. Lệnh này hoạt động với Linux Network Subsystem. Lệnh này về cơ bản hiển thị nội dung của tệp `/proc/net` được xác định trong hệ thống tệp Linux

```
nickynguyen1910@Nicky:~$ netstat
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
Active UNIX domain sockets (w/o servers)
Proto RefCnt Flags       Type       State         I-Node   Path
unix  2      [ ]         DGRAM                    20506    /var/run/chrony/chronyd.sock
unix  3      [ ]         DGRAM      CONNECTED     19865    /run/systemd/notify
unix  2      [ ]         DGRAM                    19874    /run/systemd/journal/syslog
unix  7      [ ]         DGRAM      CONNECTED     19882    /run/systemd/journal/dev-log
unix  8      [ ]         DGRAM      CONNECTED     19884    /run/systemd/journal/socket
unix  2      [ ]         DGRAM                    168      /run/user/1000/systemd/notify
unix  2      [ ]         DGRAM      CONNECTED     29812
unix  3      [ ]         STREAM     CONNECTED     29850    /run/systemd/journal/stdout
unix  3      [ ]         STREAM     CONNECTED     24588
unix  3      [ ]         STREAM     CONNECTED     20621    /run/systemd/journal/stdout
unix  3      [ ]         STREAM     CONNECTED     25669
unix  3      [ ]         STREAM     CONNECTED     25619
unix  3      [ ]         DGRAM      CONNECTED     29818
unix  3      [ ]         STREAM     CONNECTED     29840    /run/systemd/journal/stdout
unix  3      [ ]         STREAM     CONNECTED     109
unix  3      [ ]         STREAM     CONNECTED     26673
...
```

`netstat -r`: Hiển thị bảng định tuyến của hệ thống, cho biết các tuyến đường mạng mà hệ thống sử dụng.

```
nickynguyen1910@Nicky:~$ netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
default         Nicky.mshome.ne 0.0.0.0         UG        0 0          0 eth0
172.30.240.0    0.0.0.0         255.255.240.0   U         0 0          0 eth0
```


## arp Command

Lệnh `arp` (Address Resolution Protocol) được sử dụng để hiển thị và sửa đổi bộ đệm ARP, chứa ánh xạ địa chỉ IP thành địa chỉ MAC. TCP/IP stack của hệ thống sử dụng ARP để xác định địa chỉ MAC được liên kết với địa chỉ IP.Hiểu đơn giản hơn là `arp` **chỉ dùng được trong mạng nội bộ LAN** và thay vì tìm kiếm IP thì `arp` sẽ tìm kiếm địa chỉ MAC (biến đổi từ IP)

```
nickynguyen1910@Nicky:~$ arp
Address                  HWtype  HWaddress           Flags Mask            Iface
Nicky.mshome.net         ether   00:15:5d:64:0d:01   C                     eth0
```


## ifconfig Command

`ifconfig` là một tiện ích trong hệ điều hành được sử dụng để thiết lập hoặc hiển thị địa chỉ IP và mặt nạ mạng của giao diện mạng . Nó cũng cung cấp các lệnh để bật hoặc tắt giao diện. Nhiều hệ điều hành giống UNIX khởi tạo giao diện mạng của chúng bằng ifconfig khi khởi động. `ifconfig` cũng được sử dụng để xem MTU (Đơn vị truyền tải tối đa)

```
nickynguyen1910@Nicky:~$ ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.30.240.207  netmask 255.255.240.0  broadcast 172.30.255.255
        inet6 fe80::215:5dff:fe0a:d18f  prefixlen 64  scopeid 0x20<link>
        ether 00:15:5d:0a:d1:8f  txqueuelen 1000  (Ethernet)
        RX packets 1460  bytes 2042329 (2.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 850  bytes 59130 (59.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 171  bytes 15349 (15.3 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 171  bytes 15349 (15.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

## dig Command

`dig` (Domain information groper) là công cụ dùng để tìm thông tin truy vấn liên quan đến tên miền và khắc phục sự cố DNS trong Linux. Công cụ này có thể cung cấp nhiều loại bản ghi DNS, chẳng hạn như CNAME, bản ghi MX và bản ghi v.v. 

```
nickynguyen1910@Nicky:~$ dig facebook.com

; <<>> DiG 9.18.30-0ubuntu0.22.04.2-Ubuntu <<>> facebook.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 39850
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;facebook.com.                  IN      A

;; ANSWER SECTION:
facebook.com.           35      IN      A       157.240.199.35

;; Query time: 9 msec
;; SERVER: 10.255.255.254#53(10.255.255.254) (UDP)
;; WHEN: Thu Feb 13 09:14:04 +07 2025
;; MSG SIZE  rcvd: 46
```

# **3.How do you list all the running/ list some specific processes in Linux?  Explain all the columns and information you get when using the list process command?**

