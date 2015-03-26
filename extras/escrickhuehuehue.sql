create database samp;
use samp;
create table personas(
nombrea nvarchar(75),
folio nvarchar(8),
nombres nvarchar(75),
curp nvarchar(18),
nss nvarchar(11),
pension nvarchar(100),
pensionm73 nvarchar(6),
aguinaldo73 nvarchar(6),
afore73 nvarchar(6),
pensionm97 nvarchar(6),
aguinaldo97 nvarchar(6),
afore97 nvarchar(6));
insert into personas values('Inocencio Gonzalez Perez',44625367,'Juan Perez Estrada','GFRA870404HCDAON03',12345678900,'Vejez,Cesantia,Viudez',75432,54635,76345,12939,93243,82735);
delimiter //
create procedure modificaciones(in nsss nvarchar(11))
begin
	declare existente int;
	set existente = (select count(*) from personas where nss=nsss);
	if existente = 1 then
		select * from personas where nss = nsss;
	else
		select null as valido;
	end if;
end //
delimiter ;
delimiter //
create procedure consultas(in nsss nvarchar(11))
begin
	declare existente int;
	set existente = (select count(*) from personas where nss=nsss);
	if existente = 1 then
		select 'hue' as valido;
	else
		select null as valido;
	end if;
end //
delimiter ;
delimiter //
create procedure altas (in noma nvarchar(75), in fol nvarchar(8),in nomb nvarchar(75),
in curp nvarchar(18), in nss nvarchar(11), in pension nvarchar(100), in pensionm73 nvarchar(6),
in aguinaldo73 nvarchar(6), in afore73 nvarchar(6), in pensionm97 nvarchar(6),
in aguinaldo97 nvarchar(6), in afore97 nvarchar(6))
	begin
	insert into personas values(noma,fol,nomb,curp,nss,pension,pensionm73,aguinaldo73,afore73,
	pensionm97,aguinaldo97,afore97);
	end //
delimiter ;