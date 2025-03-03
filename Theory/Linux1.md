`Beginner level question`

# **1. What is Linux?**
- Linux là một họ hệ điều hành mã nguồn mở và miễn phí, có khả năng phục hồi và linh hoạt. Vào năm 1991,Linus Torvalds đã xây dựng nên nó. Mã nguồn của hệ 
  thống có thể truy cập được cho mọi người để bất kỳ ai cũng có thể xem và thay đổi, khiến cho việc bất kỳ ai cũng có thể thấy hệ thống hoạt động như thế 
  nào trở nên tuyệt vời. Mọi người trên khắp thế giới được khuyến khích cùng nhau làm việc và tiếp tục phát triển Linux vì tính mở của nó.

# **2. The basic features of Linux OS?**

- **Mã nguồn mở(Open-source)**
  - Linux là hệ điều hành mã nguồn mở, nghĩa là mã nguồn của nó có sẵn cho mọi người xem, sửa đổi và phân phối lại.  
  - Điều này giúp cộng đồng phát triển mạnh mẽ và liên tục cải tiến hệ điều hành.

- **Đa người dùng(Multiuser)**
  - Nhiều người dùng có thể đăng nhập và sử dụng hệ thống cùng lúc mà không ảnh hưởng đến hoạt động của nhau.  
  - Hệ thống quản lý quyền truy cập chặt chẽ, đảm bảo tính bảo mật cho từng người dùng.

- **Đa nhiệm (Multitasking)**
  - Linux hỗ trợ chạy nhiều tiến trình (process) đồng thời. Mỗi tiến trình có thể thực hiện một tác vụ riêng biệt và không làm gián đoạn tiến trình khác.

- **Khả năng di động (Portability)**  
  - Linux có thể chạy trên nhiều loại kiến trúc phần cứng khác nhau, từ máy tính cá nhân, máy chủ đến các thiết bị nhúng.

- **Hệ thống phân quyền mạnh mẽ (File Permissions)**
  -  Mọi file và thư mục trên Linux đều có quyền truy cập cho từng loại người dùng (chủ sở hữu, nhóm và người dùng khác), giúp bảo vệ dữ liệu và đảm bảo tính bảo mật.

- **Hệ thống tập tin phân cấp (Hierarchical File System)**
  - Linux sử dụng hệ thống file theo cấu trúc cây phân cấp, bắt đầu từ thư mục gốc `/` và phân chia thành nhiều thư mục con (như `/home`, `/etc`, `/usr`,...).

- **Hỗ trợ mạng mạnh mẽ**
  - Linux tích hợp sẵn các công cụ và tính năng mạnh mẽ cho việc quản lý và kết nối mạng, từ việc cấu hình mạng nội bộ đến thiết lập máy chủ web, FTP, DNS.

- **Bảo mật cao**
  - Linux có nhiều tính năng bảo mật như tường lửa (firewall), SELinux, AppArmor, và hệ thống quản lý user/group.  
  - Các bản vá bảo mật thường xuyên được cập nhật nhanh chóng.

- **Quản lý gói (Package Management)**
  -  Các bản phân phối Linux cung cấp hệ thống quản lý gói như `apt`, `yum`, hoặc `dnf` để dễ dàng cài đặt, cập nhật và gỡ bỏ phần mềm.

- **Khả năng lập trình mạnh mẽ**
  - Linux là môi trường lý tưởng cho các nhà phát triển vì tích hợp nhiều công cụ lập trình như Bash, Python, GCC, Git, và nhiều thư viện mã nguồn mở khác.

# **3. List some popular Linux Distro?**
- Ubuntu
- Debian
- Red Hat Enterprise Linux
- ...

# **4. Compare Linux and Window?**

|  | Linux | Window |
|-------|-------|-------|
| 1 | Linux là  hệ điều hành mã nguồn mở | 	Windows  không phải là  hệ điều hành mã nguồn mở |
| 2 | Linux là  miễn phí | 	Windows phải  trả phí  và cần có giấy phép |
| 3 | Tên tệp phân biệt chữ hoa và chữ thường , có nghĩa  file.txt là  File.txt khác nhau | 	Tên tệp không phân biệt chữ hoa chữ thường , nghĩa  file.txt là  File.txt được xử lý như nhau |
| 4 | Sử dụng 'monolithic kernel' | 	Sử dụng 'hybrid kernel' |
| 5 | Hiệu quả hơn và ổn định hơn , đặc biệt đối với máy chủ và nhà phát triển | Ít hiệu quả hơn  do các quy trình sử dụng nhiều tài nguyên |
| 6 | An toàn hơn  với khả năng kiểm soát của người dùng tốt hơn và ít lỗ hổng hơn | Ít an toàn hơn  do dễ bị phần mềm độc hại và vi-rút tấn công |
| 7 | Được  các tin tặc và chuyên gia bảo mật ưa chuộng  vì tính chất mã nguồn mở và khả năng kiểm soát của nó | Không được sử dụng rộng rãi để hack  vì thiếu các công cụ bảo mật tích hợp | 
| 8 | Có  3 loại tài khoản người dùng: (1) Regular, (2) Root, (3) Service Account  | Có  4 loại tài khoản người dùng: (1) Administrator, (2) Standard, (3) Child, (4) Guest |
| 9 | "Root user" có tất cả các quyền quản trị | "Administrator user" có tất cả các quyền quản trị | 

# **5. Basic components of Linux?**
- Cấu trúc cơ bản của Linux gồm 3 thành phần chính là:
  - Kernel (Nhân): Là phần quan trọng nhất trong Linux, có nhiệm vụ quản lý các tài nguyên của phần cứng như bộ nhớ, module, bộ vi xử lý… và giúp phần cứng có thể giao tiếp với các ứng dụng trên hệ điều hành.
  - Shell: Là nơi chứa và thực thi các dòng lệnh được yêu cầu đến cho Kernel xử lý từ người dùng hoặc ứng dụng. Đây được xem là cầu nối giữa Application và Kernel.
  - Application: Là các ứng dụng hoặc tiện ích được người dùng cài đặt và chạy trên server để phục vụ nhu cầu sử dụng (Ví dụ: Proxy, Samba và FTP…).

# **6. File permissions of Linux? Structure of a Linux file’s permission, how to change a file’s permission?**
- Có ba loại quyền tệp trong Linux: Đọc , Ghi và Thực thi .

  - **Đọc (r)**: Cung cấp quyền truy cập để mở và xem nội dung
  - **Viết (w)**: Cung cấp quyền truy cập để sửa đổi (hoặc xóa) nội dung hoặc tệp
  - **Thực thi (x)**: Cung cấp quyền truy cập để chạy tệp 

- Trong quyền tệp sẽ có 3 thành phần chính là ba bộ ba ký tự. Mỗi ký tự “rwx” trong ba ký tự này đề cập đến một thao tác khác nhau mà bạn có thể thực hiện trên tệp.Bộ ba kí tự đó đại diện cho:
  
  - **Owners**: Những quyền này chỉ áp dụng cho những cá nhân sở hữu các tệp hoặc thư mục
  - **Group**: Quyền có thể được chỉ định cho một nhóm người dùng cụ thể, chỉ ảnh hưởng đến những người trong nhóm đó
  - **Others user**: Các quyền này áp dụng chung cho tất cả người dùng trên hệ thống
```
---     ---     ---
rwx     rwx     rwx
user    group   other
```
Example:
```
drwxr-xr-x 3 nickynguyen1910 nickynguyen1910 4096 Feb 12 08:30 key
```
Ví dụ trên thì chữ "d" trước 9 kí tự đại diện cho việc "key" chính là một Directory và bộ ba kí tự đầu "rwx" cho rằng Owner có 3 quyền đọc ghi và viết, hai bộ kí tự sau chỉ có r và x chứng tỏ rằng Group và Others chỉ có quyền đọc và thực thi 

- Cách chuyển quyền trong Linux
  - Lệnh bạn sử dụng để thay đổi quyền bảo mật trên các tệp được gọi là `chmod`, viết tắt của “change mode” vì chín ký tự bảo mật được gọi chung là “mode” bảo mật của tệp

Example: 
```
-rwx------ 1 nickynguyen1910 nickynguyen1910  108 Nov  4 22:26 check.sh
```
Ta có thể thấy nhóm Group và Others đang không có quyền gì với `check.sh`
Ta có thể thêm quyền cho chúng bằng cách sau:
```
nickynguyen1910@Nicky:~/test$ chmod g+x check.sh | chmod o+x check.sh
nickynguyen1910@Nicky:~/test$ ls -l
-rwx--x--x 1 nickynguyen1910 nickynguyen1910  108 Nov  4 22:26 check.sh
```
Như vậy ta đã thêm đồng thời quyền Execute(x) cho hai nhóm trên sử dụng `chmod g+x` và `chmod o+x`.Bạn cũng có thể thay đổi nhiều quyền cùng một lúc. Ví dụ, nếu bạn muốn lấy đi tất cả các quyền của mọi người, bạn sẽ nhập `chmod ugo-rwx`

```
nickynguyen1910@Nicky:~/test$ chmod ugo-rwx check.sh
nickynguyen1910@Nicky:~/test$ ls -l
---------- 1 nickynguyen1910 nickynguyen1910  108 Nov  4 22:26 check.sh
```

Đoạn mã trên thu hồi tất cả các quyền đọc(r), ghi(w) và thực thi(x) từ tất cả người dùng(u), nhóm(g) và những người khác(o) đối với file `check.sh`


# **7. What is Linux Shell? How many types of Shell?**
- Shell trong Linux đơn giản là một trình thông dịch lệnh cung cấp giao diện người dùng cho hệ điều hành. Nó đóng vai trò chính trong việc kiểm tra các đầu 
  vào của người dùng, chuyển đổi chúng thành các chỉ thị hệ thống và thực thi tương ứng.

- Shell có hai cách sử dụng chính:

  - **Lệnh tương tác (interactive commands)**: Các lệnh được nhập từng cái một và thực thi ngay lập tức.
  - **Lệnh kịch bản (script commands)**: Là các tệp chứa một chuỗi các lệnh để thực hiện một số tác vụ tự động (thường là các tác vụ lặp đi lặp lại hoặc phức 
    tạp).

-> Chính nhờ khả năng hoạt động theo hai cách này mà shell trở thành một thành phần thiết yếu cho cả những người dùng cơ bản với giao diện đơn giản nhất và cả những người dùng cao cấp nhất với các terminal phức tạp.

- Các loại Shell phổ biến trong Linux:
  - **Bourne Shell (sh)**: Shell gốc trong các hệ thống Unix. Đơn giản, dễ sử dụng và rất phổ biến cho việc viết Shell script.Nhược điểm là ít tính năng hiện đại so với các Shell khác. File mặc định: `/bin/sh`

  - **Bourne Again Shell (Bash)**: Shell phổ biến nhất trên Linux hiện nay. Tích hợp nhiều tính năng nâng cao hơn so với Bourne Shell, chẳng hạn như auto-completion, lịch sử lệnh và quản lý biến môi trường tốt hơn. File mặc định: `/bin/bash`

  - **C Shell (csh)**: Lấy cảm hứng từ ngôn ngữ C, có cú pháp gần giống C. Hỗ trợ nhiều tính năng như quản lý lịch sử lệnh và aliasing. File mặc định: `/bin/csh`

# **8. Compare CLI and GUI in Linux?**

- *Command Line Interface(CIL)* có thể hiểu chính là giao diện dòng lệnh người dùng viết các lệnh trong cửa sổ terminal hoặc console để tương tác với hệ điều hành

- *Graphical User Interface(GUI)* cho phép người dùng sử dụng đồ họa để tương tác với hệ điều hành. Trong giao diện người dùng đồ họa, các menu được cung cấp như cửa sổ, thanh cuộn, nút, trình hướng dẫn, hình ảnh vẽ, biểu tượng thay thế, v.v khiến cho việc thao tác với hệ điều hành trở nên trực quan và dễ hiểu

Dưới đây là bảng so sánh giữa CLI và GUI

|  | CLI | GUI |
|-------|-------|-------|
| 1 | CLI khó sử dụng | Trong khi nó lại dễ sử dụng |
| 2 | Nó sử dụng ít bộ nhớ | Trong khi tiêu tốn nhiều bộ nhớ hơn |
| 3 | Trong CLI chúng ta có thể đạt được độ chính xác cao | Trong khi đó, độ chính xác thu được lại thấp |
| 4 | CLI nhanh hơn GUI | GUI chậm hơn CLI |
| 5 | Không thể sửa đổi hoặc thay đổi giao diện của CLI | Trong khi hình thức của nó có thể được sửa đổi hoặc thay đổi |
| 6 | Trong CLI, dữ liệu chỉ được nhập tại dấu nhắc lệnh | Khi ở trong GUI, dữ liệu có thể được nhập ở bất kỳ đâu trên màn hình |
| 7 | Trong CLI, thông tin được hiển thị hoặc trình bày cho người dùng dưới dạng văn bản thuần túy và tệp | Trong GUI, thông tin được hiển thị hoặc trình bày cho người dùng dưới bất kỳ hình thức nào như: văn bản thuần túy, video, hình ảnh, v.v |
| 8 | Trong CLI, không có menu nào được cung cấp | Khi ở trong GUI, menu sẽ được cung cấp |
| 9 | Không có đồ họa trong CLI | Trong khi ở GUI, đồ họa được sử dụng |
| 10 | Trong CLI, lỗi chính tả và lỗi đánh máy rất nghiêm trọng | Trong khi đó, GUI tránh được lỗi chính tả và lỗi đánh máy |
| 11 | Một số môi trường dòng lệnh cung cấp khả năng đa nhiệm nhưng việc xem nhiều thứ trên cùng một màn hình khá phức tạp | GUI cho phép người dùng dễ dàng quan sát và vận hành nhiều thứ cùng một lúc |
| 12 | CLI cho phép người dùng chỉ cần viết một loạt lệnh để thực hiện một tác vụ hoặc chạy một chương trình | GUI không cung cấp chức năng lập trình một chuỗi lệnh | 


# **9. What is hard link and soft link, compares these two types of link?**

- **Hard Link**
  - Là một liên kết trỏ trực tiếp đến inode (chỉ mục) của file gốc.
  - Không tạo ra file mới, chỉ tạo thêm một tên khác cho cùng một dữ liệu.
  - Nếu file gốc bị xóa, dữ liệu vẫn tồn tại vì hard link vẫn tham chiếu đến inode gốc.
  - Không thể tạo hard link cho thư mục.
  - Hard link chỉ hoạt động trong cùng một phân vùng (filesystem).

Example:
```
nickynguyen1910@Nicky:~/test$ echo "chao em" > file1.txt
nickynguyen1910@Nicky:~/test$ cat file1.txt
chao em
nickynguyen1910@Nicky:~/test$ ln file1.txt heygirl.txt
nickynguyen1910@Nicky:~/test$ rm file1.txt
nickynguyen1910@Nicky:~/test$ cat heygirl.txt
chao em
```

- **Soft Link**
  - Là một file chứa đường dẫn trỏ đến file/thư mục gốc.
  - Là một file độc lập, không tham chiếu trực tiếp đến inode gốc.
  - Nếu file gốc bị xóa, soft link sẽ bị “gãy” (broken link) và không thể truy cập dữ liệu.
  - Có thể tạo soft link cho cả file và thư mục.
  - Hoạt động trên nhiều phân vùng khác nhau.

Example:
```
nickynguyen1910@Nicky:~/test$ echo "em nha o dau the" > file2.txt
nickynguyen1910@Nicky:~/test$ cat file2.txt
em nha o dau the
nickynguyen1910@Nicky:~/test$ ln -s file2.txt girl.txt
nickynguyen1910@Nicky:~/test$ rm file2.txt
nickynguyen1910@Nicky:~/test$ cat girl.txt
cat: girl.txt: No such file or directory
```

Bảng so sánh giữa Hard Link và Soft Link

|   | Hard Link | Soft Link | 
|-------|-------|-------|
| Số inode | Các tập tin được liên kết cứng sẽ có cùng số inode | Các tập tin được liên kết mềm sẽ có số inode khác nhau |
| Thư mục | Không được phép sử dụng liên kết cứng cho các thư mục. (Chỉ có siêu người dùng* mới có thể thực hiện được) | Có thể sử dụng liên kết mềm để liên kết các thư mục |
| Hệ thống tập tin | Không thể sử dụng trên nhiều hệ thống tập tin | Nó có thể được sử dụng trên nhiều hệ thống tập tin |
| Dữ liệu | Dữ liệu có trong tệp gốc vẫn có sẵn trong các liên kết cứng | Liên kết mềm chỉ trỏ đến tên tệp, không lưu giữ dữ liệu của tệp | 
| Xóa tập tin gốc | Nếu tệp gốc bị xóa, liên kết vẫn hoạt động vì nó truy cập vào dữ liệu mà tệp gốc đã truy cập | Nếu tệp gốc bị xóa, liên kết sẽ không hoạt động vì nó không truy cập được dữ liệu của tệp gốc | 
| Tốc độ | Liên kết cứng tương đối nhanh hơn | Liên kết mềm chậm hơn tương đối | 

# **10. The command to create a hard link and soft link?**

- Như ví dụ ở trên thì ta có thể thấy để tạo một Hard Link ta dùng câu lệnh `ln file1 file2` còn để tạo một Soft Link ta dùng câu lệnh `ln -s file1 file2`
- Cú pháp để tạo Hard Link cụ thể như sau:
```
ln {source} {link}
ln /path/to/source /path/to/link
```
- Cú pháp để tạo Soft Link cụ thể như sau:
```
ln -s {source} {link}
```
Trong đó 
  - source: file hiện tại
  - link: file muốn liên kết bằng hard/soft link

Muốn tìm hiểu thêm ta có thể dùng câu lênh `man ln` để biết thêm

# **11. How many streams in Linux? Purpose of streams? List all the streams in Linux?**

Trong Linux, stream là khái niệm dùng để chỉ dòng dữ liệu được truyền từ một nguồn đến một đích. Mỗi chương trình khi chạy đều có một số luồng mặc định giúp quản lý việc nhập/xuất dữ liệu. Linux sử dụng luồng để giao tiếp giữa người dùng và hệ điều hành hoặc giữa các chương trình với nhau

|   | Standard Input (stdin) | Standard Output (stdout) | Standard Error (stderr) |
|-------|-------|-------|-------|
| File descriptor | 0 | 1 | 2 | 
| Mục đích | Nhận dữ liệu đầu vào từ người dùng hoặc từ các nguồn dữ liệu khác | Xuất dữ liệu ra màn hình hoặc một đích khác (như file) | Hiển thị thông báo lỗi hoặc cảnh báo của chương trình |
| Mặc định | Lấy dữ liệu từ bàn phím | In kết quả ra màn hình terminal | Xuất lỗi ra màn hình terminal | 

Example: 
```
nickynguyen1910@Nicky:~/test$ cat nonexistentfile.txt > output.txt 2>&1
nickynguyen1910@Nicky:~/test$ ls
check.sh  output.txt  test1  test2  test3
nickynguyen1910@Nicky:~/test$ cat output.txt
cat: nonexistentfile.txt: No such file or directory
```

Ta có thể thấy file `nonexistentfile` không có trên hệ thống nên khi chạy sẽ báo lỗi nhưng khi cta chuyển hướng luồng thì output của kết quả câu lệnh `cat nonexistentfile.txt` sẽ được ghi vào một file khác sử dụng hậu tố `> output.txt 2>&1`


  
