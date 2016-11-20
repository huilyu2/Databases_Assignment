select SYS_CONNECT_BY_PATH(phylum, ' --> ') as branch, level, phylum as leaf
from MIPARKE2.lis490db_tree_of_life_old
where level > 1
start with phylum = 'origin'
connect by prior phylum = parent;

create table W7_tree_of_life_old as select * from MIPARKE2.lis490db_tree_of_life_old;
create table W7_tree_of_life_new as select * from MIPARKE2.lis490db_tree_of_life_new;

delete from W7_tree_of_life_old
   where parent = 'bacteria' and phylum = 'crenarchaeota';
delete from W7_tree_of_life_old
   where parent = 'bacteria' and phylum = 'euryarchaeota';
insert into W7_tree_of_life_old (parent, phylum)
   values ('archaea','crenarchaeota');
insert into W7_tree_of_life_old (parent, phylum)
   values ('archaea','euryarchaeota');
insert into W7_tree_of_life_old (parent, phylum)
    values ('origin','archaea');

select SYS_CONNECT_BY_PATH(phylum, ' --> ') as branch, level, phylum as leaf
from w7_tree_of_life_old
where level > 1
start with phylum = 'origin'
connect by prior phylum = parent;


create table A7_umls_mesh as select * from MIPARKE2.lis490db_umls_mesh;
create table A7_umls_mesh_rels as select * from MIPARKE2.lis490db_umls_mesh_rels;

select SYS_CONNECT_BY_PATH(chd, ' --> ') as branch, level, chd as leaf
from A7_umls_mesh_rels
where level > 1
connect by prior chd = par;

select max(level)
from A7_umls_mesh_rels
where level > 1
connect by prior chd = par;

select SYS_CONNECT_BY_PATH(chd, ' --> ') as branch, level, chd as leaf
from A7_umls_mesh_rels
where level = 6
connect by prior chd = par;

select par
from A7_umls_mesh_rels
where chd = 'C0013443'
connect by prior chd = par;

select par
from A7_umls_mesh_rels
where chd = 'C0006121'
connect by prior chd = par;


select cui, concept
from a7_umls_mesh
where cui = 'C0006104' or cui = 'C0085140' or cui = 'C0012144' 
      or cui = 'C0039729' or cui = 'C0039727'
      or cui = 'C0228340' or cui = 'C0152347';

select cui, concept
from a7_umls_mesh
where cui = 'C0006104' or cui = 'C0006121' or cui = 'C0035507' 
      or cui = 'C0376353' or cui = 'C0032639'
      or cui = 'C0042600' or cui = 'C0011193';

select cui, concept
from a7_umls_mesh
where cui = 'C0036665' or cui = 'C0013443' or cui = 'C0022889' 
      or cui = 'C1735318' or cui = 'C0036030'
      or cui = 'C0024436' or cui = 'C0029893';

select cui, concept
from a7_umls_mesh
where cui = 'C0036665' or cui = 'C0013443' or cui = 'C0022889' 
      or cui = 'C1735318' or cui = 'C0042593'
      or cui = 'C0014167' or cui = 'C0014168';

select par, chd, connect_by_iscycle as CYCLE
from A7_umls_mesh_rels
connect by nocycle par = prior chd;
      
select par, chd, connect_by_iscycle as CYCLE
from A7_umls_mesh_rels
where connect_by_iscycle > 0
connect by nocycle par = prior chd;