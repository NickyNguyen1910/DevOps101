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
Lưu ý: Không nên viết sai lệnh. Chỉ có "umount" không có "unmount"

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
