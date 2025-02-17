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

Trong Linux, `top` là một công cụ động và tương tác cung cấp thông tin thời gian thực về các quy trình hệ thống. Lệnh này cung cấp cái nhìn toàn diện về các quy trình đang chạy, việc sử dụng tài nguyên hệ thống và các số liệu quan trọng khác của hệ thống. `htop`là trình xem quy trình tương tác dành cho Linux, cung cấp giải pháp thay thế trực quan hấp dẫn và giàu tính năng cho lệnh `top`. Nó cho phép người dùng giám sát và quản lý các quy trình hệ thống theo thời gian thực với giao diện dễ sử dụng

![image_2025-02-13_100938739](https://github.com/user-attachments/assets/8ba9aa7f-175c-45ac-b44a-b6901b4bc756)

**PID (Process ID)**

- Đây là mã định danh duy nhất của mỗi tiến trình trên hệ thống.
- Mỗi tiến trình khi khởi động sẽ được gán một PID, và PID này sẽ không thay đổi cho đến khi tiến trình kết thúc.

**USER (Owner of the process)**

- Người dùng hoặc nhóm người dùng sở hữu và có quyền điều khiển tiến trình.

**PRI (Priority)**

- Độ ưu tiên của tiến trình, xác định mức độ ưu tiên CPU sẽ xử lý tiến trình đó.
- Số càng nhỏ thì độ ưu tiên càng cao. Hệ thống sẽ tự động điều chỉnh độ ưu tiên dựa trên hành vi và trạng thái của tiến trình.

**NI (Nice Value)**

- Giá trị "Nice" cho thấy mức độ thiện chí của tiến trình khi chia sẻ tài nguyên CPU.
- Phạm vi: từ -20 (ưu tiên cao nhất) đến +19 (ưu tiên thấp nhất).
- Người dùng có thể thay đổi giá trị này bằng lệnh `renice`.

**VIRT (Virtual memory usage)**

- Tổng dung lượng bộ nhớ ảo mà tiến trình được cấp phát (bao gồm cả bộ nhớ dùng chung, thư viện và bộ nhớ được phân trang ra đĩa).

**RES (Resident Set Size)**

- Bộ nhớ vật lý thực tế đang được tiến trình sử dụng, không bao gồm bộ nhớ đã bị hoán đổi (swapped out).

**SHR (Shared memory)**

- Phần bộ nhớ dùng chung giữa các tiến trình.
- Thường bao gồm thư viện dùng chung và các phân vùng bộ nhớ dùng chung khác.

**S (Process status)**

- Trạng thái hiện tại của tiến trình:

`S`: Sleeping (Đang chờ hoặc tạm dừng).
`R`: Running (Đang chạy).
`I`: Idle (Nhàn rỗi).
`D`: Uninterruptible sleep (Đang chờ xử lý I/O).
`T`: Stopped (Bị dừng).
`Z`: Zombie (Tiến trình đã chết nhưng chưa được thu hồi).

**CPU% (Percentage of CPU usage)**

- Phần trăm CPU mà tiến trình đang sử dụng.

**MEM% (Percentage of memory usage)**

- Phần trăm bộ nhớ vật lý (RAM) được tiến trình chiếm dụng so với tổng bộ nhớ hệ thống.

**TIME+ (Total CPU time)**

- Tổng thời gian CPU đã dành cho tiến trình (tính cả thời gian hệ thống và người dùng).
- Được hiển thị ở định dạng `mm:ss.ms`.

**Command (Command or process name)**

- Câu lệnh hoặc tên của chương trình khởi động tiến trình.
- Đôi khi nó có thể bao gồm toàn bộ đường dẫn hoặc các tham số đi kèm với câu lệnh.

---
Ngoài ra ta cũng có thể sử dụng câu lệnh `ps` để hiển thị trạng thái của các tiến trình tại một thời điểm cụ thể (chỉ hiển thị tĩnh, không cập nhật tự động).Dưới đây là một số cách dùng câu lệnh phổ biến:

`ps aux` 
```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.1 167224 12712 ?        Ss   08:09   0:02 /lib/systemd/systemd --system --deserialize 29
root           2  0.0  0.0   2776  1924 ?        Sl   08:09   0:00 /init
root           7  0.0  0.0   2776   132 ?        Sl   08:09   0:00 plan9 --control-socket 7 --log-level 4 --server-
root          60  0.0  0.1  47740 14896 ?        S<s  08:09   0:00 /lib/systemd/systemd-journald
root          87  0.0  0.0  21836  5680 ?        Ss   08:09   0:00 /lib/systemd/systemd-udevd
```
**USER**

- Người dùng (user) sở hữu tiến trình đó.
- Tiến trình này sẽ chạy với quyền hạn của người dùng được liệt kê.

**PID (Process ID)**

- Mã định danh của tiến trình. Đây là một số nguyên duy nhất mà hệ thống cấp cho mỗi tiến trình khi nó được tạo ra.

**%CPU**

- Phần trăm CPU mà tiến trình đang sử dụng tại thời điểm kiểm tra.
- Giá trị này thay đổi liên tục khi tiến trình tiêu thụ nhiều hoặc ít tài nguyên hơn.

**%MEM**

- Phần trăm bộ nhớ vật lý (RAM) mà tiến trình đang sử dụng, tính theo tỷ lệ với tổng bộ nhớ của hệ thống.

**VSZ (Virtual Memory Size)**

- Kích thước bộ nhớ ảo được tiến trình cấp phát, tính bằng kilobytes.
- Bao gồm toàn bộ bộ nhớ thực tế, thư viện, các phân vùng được phân trang ra đĩa (swap), và các không gian bộ nhớ được cấp phát nhưng chưa sử dụng.

**RSS (Resident Set Size)**

- Kích thước bộ nhớ thực tế đang được tiến trình sử dụng, không bao gồm bộ nhớ đã bị hoán đổi.
- Được tính bằng kilobytes và thể hiện lượng RAM thực tế mà tiến trình đang sử dụng.

**TTY (Terminal Type)**

- Terminal (hoặc pseudo-terminal) mà tiến trình được khởi động từ đó.
- Nếu là ?, điều đó có nghĩa là tiến trình không gắn liền với bất kỳ terminal nào (thường là các dịch vụ nền).

**STAT (State)**

- Trạng thái hiện tại của tiến trình. Một số trạng thái phổ biến:

  - `R`: Running (đang chạy).
  - `S`: Sleeping (ngủ ngắn hạn, đợi sự kiện).
  - `D`: Uninterruptible Sleep (đợi I/O không thể bị ngắt).
  - `T`: Stopped (bị dừng, do tín hiệu hoặc debug).
  - `Z`: Zombie (tiến trình đã kết thúc nhưng chưa được thu hồi).
  - `I`: Idle (nhàn rỗi).

- Các ký tự bổ sung có thể xuất hiện:

  - `s` (Session Leader): Tiến trình là leader của một session (ví dụ, tiến trình đầu tiên trong một phiên đăng nhập).
  - `+` (Foreground Process Group): Tiến trình đang thuộc về một nhóm tiến trình foreground (đang hoạt động trên terminal).
  - `l` (Multi-threaded): Tiến trình là một tiến trình đa luồng.
  - `<` (High Priority): Tiến trình có ưu tiên cao hơn bình thường.
  - `N` (Low Priority - Nice value lớn): Tiến trình có ưu tiên thấp hơn các tiến trình khác.
  - `L` (Locked in memory):Tiến trình bị khóa một số trang bộ nhớ trong RAM và không thể hoán đổi ra ổ đĩa (swap).
  - `X` (Dead): Tiến trình đã bị dừng hoặc không còn tồn tại (hiếm khi gặp).

**START**

- Thời điểm mà tiến trình được khởi động.
- Nếu tiến trình chạy lâu, nó có thể hiển thị ngày hoặc thời gian chính xác.

**TIME**

- Tổng thời gian CPU đã sử dụng bởi tiến trình, tính cả thời gian người dùng và thời gian hệ thống.

**COMMAND**

- Câu lệnh hoặc tên chương trình đã khởi động tiến trình đó.
- Nếu chương trình được khởi động kèm các tham số, toàn bộ câu lệnh sẽ được hiển thị.

*Ngoài ra ta có thể sử dụng `ps aux | grep <tên tiến trình>` để lọc theo tên tiến trình.Ví dụ:

```
nickynguyen1910@Nicky:~$ ps aux | grep nginx
root         210  0.0  0.0   9788   900 ?        Ss   08:09   0:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
www-data     211  0.0  0.0  10552  3516 ?        S    08:09   0:00 nginx: worker process
www-data     212  0.0  0.0  10552  3516 ?        S    08:09   0:00 nginx: worker process
www-data     213  0.0  0.0  10552  3516 ?        S    08:09   0:00 nginx: worker process
nickyng+    3570  0.0  0.0   4028  2080 pts/0    S+   10:34   0:00 grep --color=auto nginx
```

# **4.Compare the `rsync` command and `cp` command**

|  | rsync | cp |
|--|--|--|
| Chức năng chính | Dùng để đồng bộ hóa dữ liệu giữa hai thư mục hoặc hệ thống, cho phép sao chép những file đã thay đổi, giúp tiết kiệm thời gian và băng thông | Lệnh dùng để sao chép file hoặc thư mục một cách cơ bản từ nguồn đến đích. Không có chức năng đồng bộ hóa | 
| Tính năng nổi bật | **Đồng bộ hóa thông minh**: Chỉ sao chép file mới hoặc file đã thay đổi <br>**Hỗ trợ nén**: Giảm dung lượng dữ liệu khi truyền qua mạng <br>**Có thể truyền qua mạng**: Cho phép sao chép file giữa các máy tính qua SSH <br>**Kiểm tra checksum**: Đảm bảo dữ liệu được sao chép chính xác <br>**Tiếp tục nếu bị gián đoạn**: Hỗ trợ tiếp tục sao chép khi gặp lỗi hoặc mất kết nối | **Sao chép cơ bản**: Chỉ sao chép file hoặc thư mục đầy đủ <br>**Không kiểm tra dữ liệu**: Không có cơ chế kiểm tra checksum <br>**Không hỗ trợ mạng**: Không thể sao chép qua mạng <br>**Không hỗ trợ tiếp tục**: Nếu bị gián đoạn, phải sao chép lại từ đầu | 
| Tốc độ | Nhanh hơn khi làm việc với lượng lớn dữ liệu hoặc sao chép qua mạng vì nó chỉ sao chép phần dữ liệu thay đổi | Chậm hơn vì nó sao chép toàn bộ file hoặc thư mục, ngay cả khi không có thay đổi gì |

**Cách dùng**

`rsync` : `rsync -avz /source/ /destination/`

`cp` : `cp -r /source/ /destination/`

# **5.Which command is used to create a new Linux user with home directory?**

Command được dùng để tạo một user mới với thư mục home trên Linux là:

`sudo adduser <tên_user>` 

Lệnh adduser sẽ:
- Tạo thư mục home cho user mới trong `/home/<tên_user>`.
- Đặt các quyền mặc định cho thư mục home.
- Tạo group cùng tên với user mới.
- Cho phép bạn nhập mật khẩu và thông tin cá nhân khác cho user (tên đầy đủ, số điện thoại, v.v.)


Khác biệt với `useradd`

|  | adduser | useradd |
|--|--|--|
| Khi nào dùng | - Khi bạn muốn thêm user một cách dễ dàng và tự động, với cấu hình mặc định đầy đủ. <br> - Nếu bạn cần tạo home directory, đặt thông tin cá nhân, group, và mật khẩu trong một lần thao tác. | - Khi bạn muốn kiểm soát chi tiết việc tạo user bằng cách sử dụng các tùy chọn cụ thể. <br> - Nếu bạn tạo nhiều user với cấu hình đặc biệt, không cần thư mục home hoặc muốn chỉ định thư mục khác. <br> - Dùng trong scripts hoặc tự động hóa hệ thống vì useradd có thể dễ dàng điều chỉnh thông qua tùy chọn lệnh. <br> |
| Ưu điểm | - Giao diện thân thiện (hỏi lần lượt các thông tin: mật khẩu, thông tin cá nhân, thư mục home). <br> - Tự động thực hiện các bước mà useradd cần thêm nhiều tùy chọn (như tạo thư mục home, nhóm mặc định, quyền). <br> - Phù hợp cho người dùng không muốn nhớ nhiều tùy chọn lệnh phức tạp. | - Cho phép cấu hình linh hoạt hơn. <br> - Phù hợp cho admin hệ thống chuyên nghiệp hoặc trong các môi trường cần script hóa việc quản lý user. |
|  |  | Các tùy chọn thông dụng: <br> `-m`: Tạo thư mục home. <br> `-d` <đường dẫn>: Chỉ định thư mục home cụ thể. <br> `-s` <shell>: Chỉ định shell mặc định cho user. <br> `-g` <group>: Chỉ định group chính của user. |

# **6.Compare a thread and a process?**

**Process (Quá trình)**

Process có nghĩa là bất kỳ chương trình (program) nào đang được thực thi. Process control block (Khối điều khiển quá trình) điều khiển hoạt động của mọi process. Process control block chứa thông tin về các process, ví dụ process priority, process id, process state, CPU, register, v.v. Một process có thể tạo ra nhiều process khác được gọi là Child Process. Process mất nhiều thời gian hơn để kết thúc (terminate) và nó bị cô lập (isolated) có nghĩa là nó không chia sẻ bộ nhớ với bất kỳ process nào khác.

Process có thể có các trạng thái sau: new (mới), ready (sẵn sàng), running (đang chạy), waiting (đang chờ), terminated (đã chấm dứt), suspended (bị tạm ngừng).

**Thread (Luồng)**

Thread là phân đoạn của một process có nghĩa là một process có thể có nhiều thread (multiple threads) và nhiều thread này được chứa trong một process. Một thread có 3 trạng thái: running (đang chạy), ready (sẵn sàng), và blocked (bị chặn). Thread tốn ít thời gian hơn để kết thúc (terminate) so với process và KHÔNG giống như process, thread không bị cô lập có nghĩa là thread chia sẻ bộ nhớ với mọi thread khác.





 











