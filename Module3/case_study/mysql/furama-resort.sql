create database `furama-resort`;

use database_furama;


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

insert into nhan_vien
values('1','1','1','1','1992-06-29','12345689','700000','0916309250','letranson1992@gmail.com','Qu???ng b??nh','L?? Tr???n S??n'),
('2','2','2','2','1998-03-07','12345689','700000','0916309250','nguyen@gmail.com','Qu???ng b??nh','Nguy???n V??n Sang'),
('3','3','3','3','1999-03-08','12345689','700000','0916309250','thu@gmail.com','????k-L??k','Ng?? Th??? Ho??i Anh'),
('4','4','4','4','1999-03-09','12345689','700000','0916309250','trang@gmail.com','Long an','L?? Thu??? Trang'),
('5','4','4','4','1999-03-09','12345689','700000','0916309250','hai@gmail.com','Qu???ng Ng??i','Tr????ng Quang Hai'),
('6','4','4','4','1999-03-09','12345689','700000','0916309250','trang@gmail.com','Qu???ng nam','Tr???n Th??? Hu???'),
('7','6','4','4','1999-03-20','12345689','700000','0916309250','ha@gmail.com','Qu???ng ng??i','Tr????ng Th??? Th??y H???'),
('8','1','1','1','1999-03-11','12345689','700000','0916309250','nhan2@gmail.com','???? n???ng','Kh??nh'),
('9','2','2','2','1998-03-07','12345689','700000','0916309250','nguyen@gmail.com','Qu???ng b??nh','H???ng');

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

-- 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.

select*
from nhan_vien 
where (ho_va_ten like't%'or ho_va_ten like 'k%' or ho_va_ten like 'h%')and(length(ho_va_ten)<=15);

-- 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.

select*
from khach_hang
where   ((year(curdate())-year(ngay_sinh)) >=18) and ((year(curdate())-year(ngay_sinh))<= 50) and (dia_chi="???? n???ng" or dia_chi="Qu???ng tr???");

-- 4.	?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.

select k.id_loai_khach,k.id_khach_hang,k.ho_va_ten,count(h.id_khach_hang) 'count'
from khach_hang k
	right join hop_dong h on k.id_khach_hang = h.id_khach_hang
    left join loai_khach l on k.id_loai_khach = l.id_loai_khach
    where l.ten_loai_khach = 'Diamond'
    group by h.id_khach_hang
    order by count ;
    
-- 5.	Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau: ChiPhiThue + SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng. (Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).

select k.id_khach_hang, k.ho_va_ten, l.ten_loai_khach, h.id_hop_dong, d.ten_dich_vu, h.ngay_lam_hop_dong, h.ngay_ket_thuc,
(d.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia_tien) 'tong_tien'
from khach_hang k
	left join loai_khach l on k.id_loai_khach = l.id_loai_khach
    left join hop_dong h on k.id_khach_hang = h.id_khach_hang
    left join dich_vu d on h.id_dich_vu = d.id_dich_vu
    left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong_chi_tiet=hop_dong_chi_tiet.id_hop_dong_chi_tiet
    right join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem= dich_vu_di_kem.id_dich_vu_di_kem
    group by id_khach_hang;
    
-- 6.	Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? ch??a t???ng ???????c Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3).
    
select id_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
	left join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
    where dich_vu.id_dich_vu not in (
     select id_dich_vu
     from hop_dong
     where id_dich_vu is not null and month(hop_dong.ngay_lam_hop_dong)>=1 and month(hop_dong.ngay_lam_hop_dong)<=3);
     
-- 7.	Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i d???ch v??? ???? t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2018 nh??ng ch??a t???ng ???????c Kh??ch h??ng ?????t ph??ng  trong n??m 2019.

select id_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu
	left join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
 where dich_vu.id_dich_vu not in (
     select id_dich_vu
     from hop_dong
     where id_dich_vu is not null and year((hop_dong.ngay_lam_hop_dong))=2019)
     and  dich_vu.id_dich_vu in (
     select id_dich_vu
     from hop_dong
     where id_dich_vu is not null and year((hop_dong.ngay_lam_hop_dong))=2018);
     
-- 8.	Hi???n th??? th??ng tin HoTenKhachHang c?? trong h??? th???ng, v???i y??u c???u HoThenKhachHang kh??ng tr??ng nhau. H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n

select distinct ho_va_ten
from khach_hang;

select ho_va_ten
from khach_hang
	group by ho_va_ten;

select ho_va_ten
from khach_hang
	where ho_va_ten not in(
    select ho_va_ten
    from khach_hang
    where ho_va_ten is not null
    group by ho_va_ten
    having count(ho_va_ten)>1);
    
-- 9.	Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2019 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.

select thang.month, count(hop_dong.ngay_lam_hop_dong) as so_luong_dang_ky, sum(hop_dong.tong_tien)
from(select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month) as thang
	left join hop_dong on month(hop_dong.ngay_lam_hop_dong)=thang.month
    where hop_dong.id_khach_hang in(
    select id_khach_hang
    from hop_dong
    where id_khach_hang is not null) and year(ngay_lam_hop_dong)=2019 or  year(ngay_lam_hop_dong) is null or  month(ngay_lam_hop_dong) is null
    group by thang.month;

select month(ngay_lam_hop_dong), count(hop_dong.ngay_lam_hop_dong)
from hop_dong
	where id_khach_hang in(
    select id_khach_hang
    from hop_dong
    where id_khach_hang is not null) and year(ngay_lam_hop_dong)=2019
    group by hop_dong.ngay_lam_hop_dong;
    
-- 10.	Hi???n th??? th??ng tin t????ng ???ng v???i t???ng H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m. K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (???????c t??nh d???a tr??n vi???c count c??c IDHopDongChiTiet).

select hop_dong.id_hop_dong, ngay_lam_hop_dong , ngay_ket_thuc, tien_dat_coc, count(hop_dong_chi_tiet.id_dich_vu_di_kem)
from hop_dong
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong;
 
 -- 11.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng Kh??ch h??ng c?? TenLoaiKhachHang l?? ???Diamond??? v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???.
 
select dich_vu_di_kem.id_dich_vu_di_kem, ten_dich_vu, don_vi, gia_tien, trang_thai_kha_dung, ho_va_ten, ten_loai_khach, khach_hang.dia_chi
from dich_vu_di_kem
	left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
    left join hop_dong on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
    left join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
    left join loai_khach on loai_khach.id_loai_khach = khach_hang.id_loai_khach
   where loai_khach.ten_loai_khach = 'Diamond' and (khach_hang.dia_chi='Vinh' or khach_hang.dia_chi = 'Qu???ng ng??i');
   
   -- 12.	Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (???????c t??nh d???a tr??n t???ng H???p ?????ng chi ti???t), TienDatCoc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 th??ng
   -- cu???i n??m 2019 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2019.

select hop_dong.id_hop_dong, nhan_vien.ho_va_ten as nhan_vien, khach_hang.ho_va_ten as khach_hang,
 khach_hang.sdt, dich_vu.ten_dich_vu, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_luong_dich_vu_di_kem,sum(hop_dong.tien_dat_coc)
from hop_dong
	left join nhan_vien on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
    left join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
    left join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
    left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
    left join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
    where not exists( select hop_dong.id_hop_dong where hop_dong.ngay_lam_hop_dong between '2019-01-01' and '2019-06-31')
    and exists( select hop_dong.id_hop_dong where hop_dong.ngay_lam_hop_dong between '2019-10-01' and '2019-12-31')
    group by hop_dong.id_dich_vu;
    
-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).
create temporary table temp
select dich_vu_di_kem.id_dich_vu_di_kem, ten_dich_vu, don_vi, gia_tien , count(hop_dong_chi_tiet.id_dich_vu_di_kem)
from dich_vu_di_kem
 left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
 group by hop_dong_chi_tiet.id_dich_vu_di_kem;
 select*from temp;
 
 -- 14.	Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. Th??ng tin hi???n th??? bao g???m IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
 
 select hop_dong_chi_tiet.id_hop_dong, dich_vu_di_kem.ten_dich_vu, count(dich_vu_di_kem.id_dich_vu_di_kem) as so_lan_su_dung
 from dich_vu_di_kem
	left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
 group by hop_dong_chi_tiet.id_dich_vu_di_kem
 having so_lan_su_dung = 1;
 
 -- 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2018 ?????n 2019.
 
 select nhan_vien.id_nhan_vien, ho_va_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, so_dien_thoai, dia_chi, count(id_hop_dong) as so_hop_dong
 from nhan_vien
	left join hop_dong on hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
    inner join trinh_do on trinh_do.id_trinh_do = nhan_vien.id_trinh_do
    inner join bo_phan on bo_phan.id_bo_phan = nhan_vien.id_bo_phan
    where year(hop_dong.ngay_lam_hop_dong)>=2018 and year(hop_dong.ngay_lam_hop_dong)<=2018
    group by id_nhan_vien
    having so_hop_dong <=3;
    
-- 16.	X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2019.;

delete from nhan_vien
where id_nhan_vien not in (
 select hop_dong.id_nhan_vien
 from hop_dong
 where id_nhan_vien is not null and (year(hop_dong.ngay_lam_hop_dong)>=2017 and year(hop_dong.ngay_lam_hop_dong)<=2019)
 group by hop_dong.id_nhan_vien);

-- 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? TenLoaiKhachHang t???  Platinium l??n Diamond, ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i t???ng Ti???n thanh to??n trong n??m 2019 l?? l???n h??n 10.000.000 VN??.

update khach_hang , (select hop_dong.id_khach_hang as id, sum(hop_dong.tong_tien) as tong_tien from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2019
group by hop_dong.id_khach_hang
having tong_tien >= 10000) as temp
set khach_hang.id_loai_khach = (select loai_khach.id_loai_khach from loai_khach where loai_khach.ten_loai_khach = "Diamond")
where khach_hang.id_loai_khach = (select loai_khach.id_loai_khach from loai_khach where loai_khach.ten_loai_khach = "Platinium")
and temp.id = khach_hang.id_khach_hang;

-- 18.	X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2016 (ch?? ?? r??ng bu???c gi???a c??c b???ng).

delete from hop_dong
where year(hop_dong.ngay_lam_hop_dong)>2016;

-- 19.	C???p nh???t gi?? cho c??c D???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2019 l??n g???p ????i

update dich_vu_di_kem , (select hop_dong_chi_tiet.id_dich_vu_di_kem as id, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_lan from hop_dong_chi_tiet
group by hop_dong_chi_tiet.id_dich_vu_di_kem
having so_lan>10)as temp
set dich_vu_di_kem.gia_tien = dich_vu_di_kem.gia_tien*2
where temp.id = dich_vu_di_kem.id_dich_vu_di_kem;

-- 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c Nh??n vi??n v?? Kh??ch h??ng c?? trong h??? th???ng, th??ng tin hi???n th??? bao g???m ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

select nhan_vien.id_nhan_vien as id, nhan_vien.ho_va_ten as ho_va_ten, nhan_vien.email as email, nhan_vien.so_dien_thoai as so_dien_thoai, nhan_vien.ngay_sinh as ngay_sinh, nhan_vien.dia_chi as dia_chi
from nhan_vien
union all
select khach_hang.id_khach_hang as id, khach_hang.ho_va_ten as ho_va_ten, khach_hang.email as email, khach_hang.sdt as so_dien_thoai, khach_hang.ngay_sinh as ngay_sinh, khach_hang.dia_chi as dia_chi
from khach_hang;

 
