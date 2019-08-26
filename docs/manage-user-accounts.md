## 1  Quản lý tài khoản mail

Sử dụng lệnh zmprov để quản lý thông tin tài khoản người dùng trên Zimbra

- List tài khoản

`zmprov -l gaa`

- Tạo tài khoản

syntax:

`zmprov ca <email> <passoword> displayName <display-name>`

ex:

`zmprov ca user1@example.com Password displayName User1`

- Tạo alias name

`zmprov aaa user1@example.com support1@example.com`

- Thiết lập password

syntax: zmprov sp <email> <password>

`zmprov sp user1@example.com P@ssw0rd`

- To rename a user

`zmprov ra user2@ example.com  test2@ example.com`

-  Delete an account

`zmprov da user1@ example.com`

## 2. Quản lý nhóm (distribution list)

- List tất cả danh sách distribution

`zmprov gadl`

- Tạo một distribution list

syntax: zmprov cdl <distribution-name>

ex:

`zmprov cdl techteam@example.com`

- Thêm members vào distribution list

syntax: zmprov adlm <distribution-name> <member1> <member2> …

ex: 

`zmprov adlm techteam@example.com member1@example.com member2@example.com`

- Check members trong một distribution list

`zmprov gdlm <distribution-name>`

ex: 

`zmprov gdlm techteam@example.com`

## 3. Quản trị người dùng

Chúng ta sử dụng lệnh zmmailbox để thực hiện các tùy chọn cho quản lý thông tin tài khoản người dùng

- Check size  tài khoản người dùng

`zmmailbox -z -m <email> gms`

- Check các chức năng của người dùng

`zmmailbox -z -m <email> gaf`

- Backup zimbra user account

`zmmailbox -z -m useraccount getRestURL "//?fmt=tar" > /backup/user.tar.gz`

- Restore user account

`zmmailbox -z -m user postRestURL "//?fmt=tar" /backup/user.tar.gz`
