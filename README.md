# MyPham
b1: clone project
	git clone https://github.com/PowerOfTheFan/Web-Testting.git
b2: tạo 1 nhánh tại local (tại máy)
	-git checkout -b tên_nhánh
	- git checkout tên_nhánh (chuyển đổi nhánh là việc)
	
	... thực hiện code các chức năng được yêu cầu trên jira
	...
	kiểm tra trạng thái: git status
	
b3: thực hiện add file, commit thay đổi	
	- git add * (add tất cả các file có thay đổi tại nhánh đang làm việc)
	- git add tên_file (đường dẫn của file/tên_file) để add 1 file cụ thể
	
	- sau khi add 1 file hoặc nhiều file cần thực hiện commit
	git commit -m "nội dung commit (bắt buộc)" : nên commit có nghĩa
	- gõ lại git status để xem kết quả.

b4: thực hiện merge giữa 2 nhánh
	- git merge tên_nhánh_merge ( ví dụ merge nhánh AAA và nhánh hiện tại: git merge AAA)

b5: sau khi run lệnh merge nếu xảy ra conflict
	- git mergetool (gọi công cụ merge) thực hiện merge bằng tool, gợi ý diffmerge
	- hoặc chỉnh sửa bằng cách mở file thực hiện Edit
	
b6: sau khi merge xong phải xác nhận
	- git commit -m "thông điệp"
	
	
b7: thực hiện pull(hoặc fetch) remote repo từ serve
	- git pull / git fetch (fetch chỉ nạp source về, ko tự động merge giống như pull)
	- xảy ra conflict quay lại b5

b8: merge source sau khi fetch
	- git merge tên_nhánh
	
b9: push source lên server
	- git push

*** xem có bao nhiêu nhánh làm việc:
	- git branch (hiện tất cả các nhánh tại local)
	- git branch -a (hiện tất cả nhánh của local và remote)
	- git branch -r (chỉ hiện nhánh remote)
	
* git push origin --delete feature/login xóa remote branch từ local
