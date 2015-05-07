create database Foto_Dukkani
use Foto_Dukkani
create table Uyeler
(
ID int identity(1,1),
Kullanici_Adi nvarchar(20),
Sifre nvarchar(20),
Ad nvarchar(20),
Soyad nvarchar(20),
Tc nvarchar(11),
Mail nvarchar(50),
Adres nvarchar(500),
Cinsiyet nvarchar(5),
Dogum_Tarihi nvarchar(20)
)
create table Urunler(ID int identity(1,1),
Urun_Kod nvarchar(20),
Urun_Adi nvarchar(100),
Urun_Fiyat int,
Urun_Resim nvarchar(max),
Urun_Stok int
)

create table Ozellikler (ID int identity(1,1),
Urun_Kod nvarchar(20),
Format nvarchar(100),
Cozunurluk nvarchar(100),
ISO nvarchar(100),
Seri_Mod nvarchar(20),
Video_Cekim nvarchar(5),
Video_Cozunurluk nvarchar(100),
Ekran_Boyutu nvarchar(100),
Agýrlýk nvarchar(100))

