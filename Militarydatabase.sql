Create database MilitaryDatabase;

use MilitaryDatabase

SET SQL_SAFE_UPDATES=0;

create table if not exists soldier
(
soldier_ID char(5) not null primary key,
soldier_name varchar(10),
base_code char(5),
Dept_ID char(5),
rank varchar(10)
);

insert into soldier values('00000', 'Joe',   'A104', 'D333', 'PVT');
insert into soldier values('00001', 'Jimmy', 'A132', 'D333', 'PVT');
insert into soldier values('00002', 'John',  'A111', 'D335', 'PVT');
insert into soldier values('00003', 'Ogi',   'A105', 'D363', 'SSG');
insert into soldier values('00004', 'Simon', 'A104', 'D385', 'CSM');
insert into soldier values('00005', 'Tom',   'A136', 'D379', 'BG');
insert into soldier values('00006', 'Jerry', 'A111', 'D335', '1LT');
select * from soldier;
update soldier
set Dept_ID = 'D634'
where soldier_name = 'Jimmy';

create table if not exists Training
(
training_code char(5) not null primary key,
training_name varchar(15),
soldier_ID char(5),
weapon_ID char(5),
weapon_name varchar(20)
);

insert into Training values('36677', 'grappling',   '00001', '', '');
insert into Training values('22443', 'CQB', '00004', '888', 'knife');
insert into Training values('55779', 'gunshot',  '00001', '555', 'gun');
insert into Training values('66884', 'shooting',   '00004', '5555', 'gun');
insert into Training values('22895', 'taekwondo', '00006', '', '');
insert into Training values('77889', 'driving',   '00003', '', '');
insert into Training values('66552', 'bayonet drill', '00003', '111', 'rifle');
select * from Training;


create table if not exists Weapon
(
weapon_ID char(5),
weapon_name varchar(20),
purchase_date DATE null,
missing_date DATE null
);

insert into Weapon values('111', 'rifle',   '2020-03-01', '2022-03-05');
insert into Weapon values('222', 'grenade', '2020/10/29', null);
insert into Weapon values('333', 'grenade launcher',  '2020/10/10', null);
insert into Weapon values('555', 'gun',   '2020/07/14', '2022/02/27');
insert into Weapon values('666', 'sniper rifle', '2020/08/30', null);
insert into Weapon values('777', 'Rocket launcher',   '2021/01/01', null);
insert into Weapon values('888', 'knife', '2021/01/01', null);
insert into Weapon values('1111', 'rifle',   '2020-03-01', null);
insert into Weapon values('2222', 'grenade', '2020/10/29', null);
insert into Weapon values('3333', 'grenade launcher',  '2020/10/10', null);
insert into Weapon values('5555', 'gun',   '2020/07/14', null);
insert into Weapon values('6666', 'sniper rifle', '2020/08/30', null);
insert into Weapon values('7777', 'Rocket launcher',   '2021/01/01', null);
insert into Weapon values('8888', 'knife', '2021/01/01', null);
select * from Weapon;


create table if not exists warehouse
(
house_ID char(5),
house_name varchar(20),
weapon_ID char(5),
weapon_name varchar(20)
);

insert into warehouse values('H-01', 'Topaz', '111', 'rifle');
insert into warehouse values('H-01', 'Topaz', '222', 'grenade');
insert into warehouse values('H-01', 'Topaz', '333', 'grenade launcher');
insert into warehouse values('H-01', 'Topaz', '555', 'gun');
insert into warehouse values('H-02', 'Semi', '666', 'sniper rifle');
insert into warehouse values('H-02', 'Semi', '777', 'Rocket launcher');
insert into warehouse values('H-02', 'Semi', '888', 'knife');
insert into warehouse values('H-02', 'Semi', '1111', 'rifle');
insert into warehouse values('H-04', 'Cho', '2222', 'grenade');
insert into warehouse values('H-04', 'Cho', '3333', 'grenade launcher');
insert into warehouse values('H-04', 'Cho', '5555', 'gun');
insert into warehouse values('H-04', 'Cho', '6666', 'sniper rifle');
insert into warehouse values('H-04', 'Cho', '7777', 'Rocket launcher');
insert into warehouse values('H-04', 'Cho', '8888', 'knife');
select * from warehouse;



#select

# select involving the Union operation
# Find all name of the weapon that store in warehouse 'H-01' and 'H-04'
select weapon_name from warehouse
where house_ID = 'H-01'
union
select weapon_name from warehouse
where house_ID = 'H-04';


# Find all number of missing weapon from each warehouse
select house_ID, count(missing_date) from warehouse, weapon
where warehouse.weapon_ID = weapon.weapon_ID
group by house_ID;

# Find all name of the soldier who have traning for CQB
select soldier_name, training_name from soldier, training
where soldier.soldier_ID = training.soldier_ID
and training_name = 'CQB';

# Find all the name of training that Jimmy takes
select training_name, soldier_name from soldier, training
where soldier.soldier_ID = training.soldier_ID
and soldier_name = 'Jimmy';

select training_name, soldier_name from soldier, training
where soldier.soldier_ID = training.soldier_ID
and soldier.soldier_ID in
(select soldier_ID from training
where soldier_name = 'Jimmy');



select soldier_name, count(training_name) from soldier, training 
where soldier.soldier_ID = training.soldier_ID
group by soldier_name having count(training_name) > 1; 

# insert

insert into soldier values('02000', 'Andy', 'A888', 'D328', 'PVT');
insert into soldier values('02111', 'Chou', 'A456', 'D321', 'PVT');
insert into soldier values('02333', 'Weyne', 'A222', 'D322', 'PVT');
select * from soldier;
insert into Weapon values('9999', 'machinegun', '2021/05/01', null);
insert into Weapon values('9988', 'machinegun', '2021/05/01', '2022/03/25');
insert into Weapon values('9977', 'machinegun', '2021/05/01', null);
select * from Weapon;

# Create a soldier.PVT table with soldier rank PVT. 
Create table soldierPVT as
Select * from soldier where rank = 'PVT';

# Create a soldiertraining2 table with soldier who take more than one training. 
Create table soldiertraining2 as
select soldier.soldier_ID, soldier_name, rank, training_name from soldier, training
where soldier.soldier_ID = training.soldier_ID;

select * from soldiertraining2;

# delete one tuple or a set of tuples: from one table, from multiple tables.
delete from soldiertraining2
where soldier_name = 'Jerry';

# update one tuple or a set of tuples: from one table, from multiple tables.
select * from soldier;
update soldier
set rank = '1LT'
where soldier_name = 'Chou';


select * from training;
# create view

create view SoldierPVTCSMTraining as
select soldier.soldier_ID, soldier_name, base_code, Dept_ID, rank, training_name, weapon_name from soldier, training
where soldier.soldier_ID = training.soldier_ID
and rank = 'PVT' 
union
select soldier.soldier_ID, soldier_name, base_code, Dept_ID, rank, training_name, weapon_name from soldier, training
where soldier.soldier_ID = training.soldier_ID
and rank = 'CSM';

create view SoldiernotPVT as
select * from soldier
where rank != 'PVT' ;


select * from SoldiernotPVT;


select * from SoldiernotPVT
where rank = 'BG';

insert into SoldiernotPVT values('02037', 'Urdy', 'A888', 'D333', 'CSM');

update SoldiernotPVT
set Dept_ID = 'D385'
where soldier_name = 'Urdy';

delete from SoldiernotPVT
where soldier_name = 'Jerry';


#######################################




#insert soldier
Delimiter $$ 
create trigger new_soldier after insert on soldier 
for each row 
begin 
insert into soldier_record values(concat('soldier ',new.soldier_name,' has been added by ',current_user(), ' on 
',current_date())); 
end; 
$$ 
Create table soldier_record (message varchar(90));  


insert into soldier values('00557', 'Chen', 'A104', 'D333', 'PVT');
 
select * from soldier;
select * from soldier_record;
# drop trigger new_soldier; 



#update soldier
Delimiter $$ 
create trigger update_soldier after update on soldier 
for each row 
begin 
insert into soldier_record values(concat('soldier ', old.soldier_name,' has been updated by ',current_user(), ' on 
',current_date())); 
end; 
$$ 



update soldier set Dept_ID = 'Y777' where soldier_name = 'Simon'; 
# drop trigger update_soldier; 

#update weapon
Delimiter $$ 
create trigger update_weapon after update on weapon 
for each row 
begin 
insert into weapon_record values(concat('weapon ', old.weapon_ID,' has been updated by ',current_user(), ' on 
',current_date())); 
end; 
$$ 
Create table weapon_record (message varchar(90));
update weapon set missing_date = '2022/02/05' where weapon_ID = '888'; 

select * from weapon;
select * from weapon_record;



# count the number of soldier for each rank after Insert 
Delimiter $$ 
create trigger total_rank_soldier after insert on num_soldier 
for each row 
begin 
delete from total_rank_soldier; 
insert total_rank_soldier 
select rank, count(rank) from num_soldier group by rank; 
end; 
$$ 
create table num_soldier
(soldier_ID char(5) not null primary key,
soldier_name varchar(10),
base_code char(5),
Dept_ID char(5),
rank varchar(10)); 
create table total_rank_soldier(rank varchar(15), count_rank double); 

insert into num_soldier values('00000', 'Joe',   'A104', 'D333', 'PVT');
insert into num_soldier values('00001', 'Jimmy', 'A132', 'D333', 'PVT');
insert into num_soldier values('00002', 'John',  'A111', 'D335', 'PVT');
insert into num_soldier values('00003', 'Ogi',   'A105', 'D363', 'SSG');
insert into num_soldier values('00004', 'Simon', 'A104', 'D385', 'CSM');
insert into num_soldier values('00005', 'Tom',   'A136', 'D379', 'BG');
insert into num_soldier values('00006', 'Jerry', 'A111', 'D335', '1LT');
insert into num_soldier values('00557', 'Chen', 'A104', 'D333', 'PVT');
select * from total_rank_soldier;
select * from num_soldier;

# drop trigger total_rank_soldier; 

select * from num_soldier;
# count the number of soldier for each rank after update
Delimiter $$ 
create trigger total_rank_soldier_update after update on num_soldier 
for each row 
begin 
delete from total_rank_soldier; 
insert total_rank_soldier 
select rank, count(rank) from num_soldier group by rank; 
end; 
$$ 

update num_soldier
set rank = 'CSM'
where soldier_name = 'Chen';

select * from total_rank_soldier;

#################################################
Delimiter $$
create trigger Training_delete after delete on training 
for each row
begin
delete from soldier where soldier_ID = old.soldier_ID;
end;
$$
  
delete from training 
where training_name='grappling';

# drop trigger Training_delete;

select * from soldier;
select * from training;

#####################################################

Create table log (message varchar(90));
Create table anytable (message varchar(90));

Delimiter $$ 
create trigger addtraining before 
insert on training 
for each row 
begin 
declare temp Int; 
set temp=0; 
select count(*) into temp from soldier 
where soldier_ID = new.soldier_ID; 
if temp=0 then 
insert into log values(concat('soldier',new.soldier_ID, ' is not in the system')); 
insert into anytable values('Just to cause error');
end if; 
end; 
$$ 

insert into training values('55555','bomb','77777','', ''); 

select * from training;
select * from log;
select * from anytable;

# drop trigger addtraining;


Delimiter $$
create trigger insert_soldier before insert on soldier
for each row
begin
if new.rank = '' then
insert into log values(concat('soldier ',new.soldier_ID, ' rank can not be empty'));
end if;
end;
$$

insert into soldier values('99999', 'kevin',   'A104', 'D333', '');

select * from soldier;
select * from log;

#drop trigger insert_soldier;
