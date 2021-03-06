create database `furama-resort`;

use `furama-resort`;


create table kieu_thue(
id_kieu_thue int primary key,
ten_kieu_thue varchar(45),
gia int
);

create table loai_dich_vu(
id_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);

create table dich_vu(
id_dich_vu int primary key,
ten_dich_vu varchar(30),
dien_tich int,
so_tang int,
so_nguoi_toi_da int,
chi_phi_thue int,
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(30),
foreign key (id_kieu_thue) references kieu_thue (id_kieu_thue),
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);

create table trinh_do(
id_trinh_do int primary key,
ten_trinh_do varchar(45)
);

create table vi_tri(
id_vi_tri int primary key,
ten_vi_tri varchar(45)
);

create table bo_phan(
id_bo_phan int primary key,
ten_bo_phan varchar(30)
);

create table nhan_vien(
id_nhan_vien int primary key,
ho_va_ten varchar(45),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
ngay_sinh date,
so_cmnd varchar(9),
luong int,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key(id_vi_tri) references vi_tri(id_vi_tri),
foreign key(id_trinh_do) references trinh_do(id_trinh_do),
foreign key(id_bo_phan) references bo_phan(id_bo_phan)
);

create table loai_khach(
id_loai_khach int primary key,
ten_loai_khach varchar(45)
);

create table khach_hang(
id_khach_hang int primary key,
id_loai_khach int,
ho_va_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(9),
sdt varchar(10),
email varchar(45),
dia_chi varchar(45),
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);

create table dich_vu_di_kem(
id_dich_vu_di_kem int primary key,
ten_dich_vu varchar(45),
don_vi varchar(45),
gia_tien int,
trang_thai_kha_dung varchar(45)
);

create table hop_dong(
id_hop_dong int primary key,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien) on delete cascade,
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int,
foreign key (id_hop_dong) references hop_dong(id_hop_dong) on delete cascade,
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);

-- them moi vi tri nhan vien 

insert into vi_tri
values('1','L??? t??n'),
('2','Ph???c v???'),
('3','Chuy??n vi??n'),
('4','Gi??m s??t'),
('5','Qu???n l??'),
('6','Gi??m ?????c');

-- them moi bo phan nhan vien-- 

insert into bo_phan
values('1','Sale-Marketing'),
('2','H??nh ch??nh'),
('3','Ph???c v???'),
('4','Qu???n l??');

-- them moi trinh do nhan vien

insert into trinh_do
values('1','Trung c???p'),
('2','Cao ?????ng'),
('3','?????i h???c'),
('4','Sau ?????i h???c');

-- Th??m m???i th??ng tin nh??n vi??n
select * from nhan_vien;
insert into nhan_vien values ('1','L?? Tr???n S??n','1','1','1','1992-06-29','123456789','900000','0886727428','letranson1992@gmail.com','Qu???ng B??nh'),
('2','L?? ','1','1','1','1994-08-28','123456789','700000','0583276518','letranson1993@gmail.com','Qu???ng Tri'),
('3','Ryuk','1','1','1','1992-06-29','123456789','900000','0583276518','letranson1994@gmail.com','Qu???ng B??nh'),
('4','Jacky','1','1','1','1992-06-29','123456789','900000','0583276518','letranson1995@gmail.com','Qu???ng B??nh'),
('5','Hai','1','1','1','1992-06-29','123456789','900000','0583276518','letranson1996@gmail.com','Qu???ng B??nh'),
('6','Yasu','1','1','1','1992-06-29','123456789','900000','0583276518','letranson1997@gmail.com','Qu???ng B??nh');


-- Th??m m???i lo???i kh??ch h??ng

insert into loai_khach
values('1','Diamond'),
('2','Platinium'),
('3','Gold'),
('4','Silver'),
('5','Member');

-- Th??m m???i th??ng tin khach h??ng

insert into Khach_hang
values('1','1','Nguy???n th??? thanh','1997-03-15','123456789','0916309250','thanh@gnail.com','???? n???ng'),
('2','4','Nguy???n v??n th???nh','1999-03-15','123456789','0916309250','thinh@gnail.com','Qu???ng ng??i'),
('3','2','Ho??ng h???ng','2001-08-15','123456789','0916309250','hong@gnail.com','Qu???ng b??nh'),
('4','3','Ng?? th??? m??? duy??n','1998-03-15','123456789','0916309250','duyen@gnail.com','Qu???ng b??nh'),
('5','1','Nguy???n th??? thu th???y','1985-11-15','123456789','0916309250','thuy@gnail.com','???? n???ng'),
('6','1','H???ng','1997-03-15','123456789','0916309250','thanh@gnail.com','???? n???ng'),
('7','4','Kh??nh','1999-03-15','123456789','0916309250','thinh@gnail.com','Qu???ng ng??i'),
('8','4','Thu','1999-03-15','123456789','0916309250','thinh@gnail.com','Qu???ng ng??i'),
('9','2','H???ng','1999-03-15','325545','5454545','tanh@gnail.com','Quang binh'),
('10','1','Nguy???n th??? thanh','1997-03-15','123456789','0916309250','thanh@gnail.com','Vinh'),
('11','1','Nguy???n v??n th???nh','1999-03-15','123456789','0916309250','thinh@gnail.com','Qu???ng ng??i'),
('12','1','Ho??ng h???ng','2001-08-15','123456789','0916309250','hong@gnail.com','Qu???ng ng??i');

-- Th??m m???i lo???i d???ch v???

insert into Loai_dich_vu
values('1','Villa'),
('2','House'),
('3','Room');

-- th??m m???i ki??u thu??

insert into kieu_thue
values('1','N??m','500000'),
('2','Th??ng','200000'),
('3','Ng??y','10000'),
('4','Gi???','500');

-- Th??m m???i d???ch v???

insert into dich_vu
values('1','Villa 1','500','2','6','50000','1','2','c??n ph??ng'),
('2','house1','500','2','6','50000','2','3','c??n ph??ng'),
('3','Villa 2','500','2','6','50000','1','2','c??n ph??ng'),
('4','Room1','500','2','6','50000','3','3','c??n ph??ng'),
('5','house 2','500','2','6','50000','2','2','c??n ph??ng'),
('6','Villa 3','500','2','6','50000','1','2','c??n ph??ng');

-- Th??m d???ch v??? ??i k??m

insert into dich_vu_di_kem
values('1','Massage','ng?????i','200','c??n tr???ng'),
('2','Karaoke','gi???','50','c??n tr???ng'),
('3','Th???c ??n','Ph???n','70','c??n'),
('4','N?????c u???ng','ly','15','c??n'),
('5','Tham quan','ng?????i','200','c??n tr???ng');

-- Th??m m???i h???p ?????ng

insert into	hop_dong
values('1','1','1','1','2021-11-02','2021-11-07','5005','700000'),
('2','4','4','3','2021-11-02','2021-11-07','5005','700000'),
('3','2','2','2','2021-11-02','2021-11-07','5005','700000'),
('4','5','3','1','2021-11-02','2021-11-07','5005','700000');

insert into	hop_dong
values('5','1','1','1','2021-11-02','2021-11-07','5005','700000'),
('6','1','4','3','2021-11-02','2021-11-07','5005','700000'),
('7','2','2','1','2021-11-02','2021-11-07','5005','700000'),
('8','5','3','1','2021-11-02','2021-11-07','5005','700000');

insert into	hop_dong
values('9','1','6','1','2021-11-02','2021-11-07','5005','700000'),
('10','1','6','3','2021-11-02','2021-11-07','5005','700000'),
('11','2','6','1','2021-11-02','2021-11-07','5005','700000');

insert into	hop_dong
values('12','1','6','1','2018-11-02','2021-11-07','5005','700000'),
('13','1','6','3','2018-11-02','2021-11-07','5005','700000');

insert into	hop_dong
values('14','4','1','1','2019-11-02','2021-11-07','5005','700000'),
('15','3','2','3','2019-11-02','2021-11-07','5005','700000');

insert into	hop_dong
values('16','4','10','1','2019-11-02','2021-11-07','5005','700000'),
('17','3','11','3','2019-11-02','2021-11-07','5005','700000'),
('18','3','12','3','2019-11-02','2021-11-07','5005','700000');

-- Th??m m???i h???p ?????ng chi ti???t

insert into hop_dong_chi_tiet
values('1','1','2','3'),
('2','2','3','3'),
('3','3','1','5'),
('4','4','4','4');

insert into hop_dong_chi_tiet
values('5','16','2','3'),
('6','17','3','3'),
('7','18','1','5'),
('8','16','4','4');

insert into `account` values ('admin','123456'),
('ryuk','123');
select * from `account`;