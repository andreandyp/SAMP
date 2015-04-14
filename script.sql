create database samp;
use samp;
create table usuarios(
usuario nvarchar(10),
clave nvarchar(16));
create table deshabilitados(
nombrea nvarchar(75),
nombres nvarchar(75),
curp nvarchar(18),
nss bigint(11),
regimen int(4));
create table personas(
nombrea nvarchar(75),
folio int(8),
nombres nvarchar(75),
curp nvarchar(18),
nss bigint(11),
pension nvarchar(100),
pensionm73 int(6),
aguinaldo73 int(6),
afore73 int(6),
pensionm97 int(6),
aguinaldo97 int(6),
afore97 int(6),
regimen int(4),
activo tinyint(1));
/*create user 'IMSS'@'localhost' identified by 'ClaveSecreta127';
grant insert,select,update on samp.* to 'IMSS'@'localhost';
flush privileges;
*/
insert into personas values('Inocencio Gonzalez Perez',44625367,'Juan Perez Estrada','GFRA870404HCDAON03',12345678900,'Vejez,Cesantia,Viudez',75432,54635,76345,12939,93243,82735,1993,1);
insert into personas values('Basilio Hernandez Gutierrez',44625367,'Carlos Escobar del Monte','HGTA876540JNFTNS04',00987654321,'Vejez,Viudez',75432,54635,76345,12939,93243,82735,1997,1);
insert into usuarios values('IMSS','huehuehue');
delimiter //
create procedure login(in user nvarchar(10),in pass nvarchar(10))
	begin
    declare existente int;
	set existente = (select count(*) from usuarios where usuario=user and clave=pass);
	if existente = 1 then
		select * from usuarios where usuario=user and clave=pass;
	else
		select null as valido;
	end if;
end //
delimiter ;
delimiter //
create procedure modificaciones(in nsss bigint(11),in regimenn int(4))
begin
	declare existente int;
	set existente = (select count(*) from personas where nss=nsss and activo=1);
	if existente = 1 then
		select * from personas where nss = nsss;
        update personas set regimen=regimenn where nss = nsss;
	else
		set existente = 0;
	end if;
end //
delimiter ;
delimiter //
create procedure consultas(in nsss bigint(11))
begin
	declare existente int;
	set existente = (select count(*) from personas where nss=nsss and activo=1);
	if existente = 1 then
		if (select regimen from personas where nss=nsss) = 'IMSS' then
			select nombrea,folio,nombres,curp,nss,pension,regimen,pensionm73,aguinaldo73,afore73 from personas where nss = nsss;
		else
			select nombrea,folio,nombres,curp,nss,pension,regimen,pensionm97,aguinaldo97,afore97 from personas where nss = nsss;
		end if;
	else
		set existente = 0;
	end if;
end //
delimiter ;
delimiter //
create procedure altas(in nombreaa nvarchar(75),in nombress nvarchar(75),in curpp nvarchar(18))
	begin
		insert into personas(nombrea,nombres,curp) values(nombreaa,nombress,curpp);
	end //
delimiter ;
delimiter //
create procedure bajas(in nsss bigint(11))
	begin
		update personas set activo=0 where nss = nsss;
        insert into deshabilitados values((select nombrea,nombres,curp,nss,regimen from personas));
	end //
delimiter ;