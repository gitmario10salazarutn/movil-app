create table punto(
    id_punto integer not null identity,
    coord_x integer not null,
    coord_y integer not null,
    constraint pk_punto primary key(id_punto)
);
create table recta(
    id_recta integer not null identity,
    punto_a integer not null,
    punto_b integer not null,
    constraint pk_recta primary key(id_recta),
    constraint fk_punto_recta_a foreign key(punto_a) references punto(id_punto),
    constraint fk_punto_recta_b foreign key(punto_b) references punto(id_punto)
);
create table circunferencia(
    id_circunferencia integer not null identity,
    centro integer not null,
    radio numeric(6, 2) not null,
    constraint pk_circunferencia primary key(id_circunferencia),
    constraint fk_punto_circ foreign key(centro) references punto(id_punto)
);
create table parabola(
    id_parabola integer not null identity,
    vertice integer not null,
    p numeric(6, 2) not null,
    eje_focal varchar(1) not null,
    constraint pk_parabola primary key(id_parabola),
    constraint fk_punto_parab foreign key(vertice) references punto(id_punto)
);
create table elipse(
    id_elipse integer not null identity,
    centro integer not null,
    a numeric(6, 2) not null,
    b numeric(6, 2) not null,
    eje_focal varchar(1) not null,
    constraint pk_elipse primary key(id_elipse),
    constraint fk_punto_elipse foreign key(centro) references punto(id_punto)
);
create table hiperbola(
    id_hiperbola integer not null identity,
    centro integer not null,
    a numeric(6, 2) not null,
    b numeric(6, 2) not null,
    eje_focal varchar(1) not null,
    constraint pk_hiperbola primary key(id_hiperbola),
    constraint fk_punto_hiperbola foreign key(centro) references punto(id_punto)
);
--- My SQL ---------
create table punto(
    id_punto integer not null auto_increment,
    coord_x integer not null,
    coord_y integer not null,
    constraint pk_punto primary key(id_punto)
);
create table recta(
    id_recta integer not null auto_increment,
    punto_a integer not null,
    punto_b integer not null,
    constraint pk_recta primary key(id_recta),
    constraint fk_punto_recta_a foreign key(punto_a) references punto(id_punto),
    constraint fk_punto_recta_b foreign key(punto_b) references punto(id_punto)
);
create table circunferencia(
    id_circunferencia integer not null auto_increment,
    centro integer not null,
    radio numeric(6, 2) not null,
    constraint pk_circunferencia primary key(id_circunferencia),
    constraint fk_punto_circ foreign key(centro) references punto(id_punto)
);
create table parabola(
    id_parabola integer not null auto_increment,
    vertice integer not null,
    p numeric(6, 2) not null,
    eje_focal varchar(1) not null,
    constraint pk_parabola primary key(id_parabola),
    constraint fk_punto_parab foreign key(vertice) references punto(id_punto)
);
create table elipse(
    id_elipse integer not null auto_increment,
    centro integer not null,
    a numeric(6, 2) not null,
    b numeric(6, 2) not null,
    eje_focal varchar(1) not null,
    constraint pk_elipse primary key(id_elipse),
    constraint fk_punto_elipse foreign key(centro) references punto(id_punto)
);
create table hiperbola(
    id_hiperbola integer not null auto_increment,
    centro integer not null,
    a numeric(6, 2) not null,
    b numeric(6, 2) not null,
    eje_focal varchar(1) not null,
    constraint pk_hiperbola primary key(id_hiperbola),
    constraint fk_punto_hiperbola foreign key(centro) references punto(id_punto)
);
insert into punto(coord_x, coord_y)
values(-1, 3);
insert into punto(coord_x, coord_y)
values(-4, -1);
insert into punto(coord_x, coord_y)
values(0, 0);
insert into punto(coord_x, coord_y)
values(2, 5);
insert into punto(coord_x, coord_y)
values(2, -3);
insert into recta(punto_a, punto_b)
values(1, 4);
insert into recta(punto_a, punto_b)
values(2, 3);
insert into recta(punto_a, punto_b)
values(3, 4);
insert into recta(punto_a, punto_b)
values(5, 2);
insert into recta(punto_a, punto_b)
values(4, 5);
insert into parabola(vertice, p, eje_focal)
values(2, -3, 'x');
insert into parabola(vertice, p, eje_focal)
values(1, 4, 'y');
insert into parabola(vertice, p, eje_focal)
values(3, -5, 'y');
insert into parabola(vertice, p, eje_focal)
values(5, 6, 'x');
insert into circunferencia(centro, radio)
values(2, 3);
insert into circunferencia(centro, radio)
values(1, 4);
insert into circunferencia(centro, radio)
values(3, 5);
insert into circunferencia(centro, radio)
values(5, 6);
insert into elipse(centro, a, b, eje_focal)
values(1, 4, 3, 'x');
insert into elipse(centro, a, b, eje_focal)
values(2, 5, 4, 'y');
insert into elipse(centro, a, b, eje_focal)
values(3, 6, 4, 'y');
insert into elipse(centro, a, b, eje_focal)
values(4, 7, 5, 'x');
insert into elipse(centro, a, b, eje_focal)
values(3, 8, 6, 'x');
insert into hiperbola(centro, a, b, eje_focal)
values(1, 4, 3, 'y');
insert into hiperbola(centro, a, b, eje_focal)
values(2, 3, 5, 'x');
insert into hiperbola(centro, a, b, eje_focal)
values(3, 3, 4, 'x');
insert into hiperbola(centro, a, b, eje_focal)
values(4, 5, 4, 'y');
insert into hiperbola(centro, a, b, eje_focal)
values(3, 3, 6, 'y');
declare @points nvarchar(max)
set @points = (
        select p.id_punto,
            p.coord_x,
            p.coord_y
        from punto p
        where p.id_punto = 1 for json path
    )
select @points as points return
declare @lines nvarchar(max)
set @lines = (
        select r.id_recta as 'recta.id_recta',
            pa.id_punto as 'punto_a.id_punto',
            pa.coord_x as 'punto_a.coord_x',
            pa.coord_y as 'punto_a.coord_y',
            pb.id_punto 'punto_b.id_punto',
            pb.coord_x as 'punto_b.coord_x',
            pb.coord_y as 'punto_b.coord_y'
        from punto pa,
            recta r,
            punto pb
        where r.punto_a = pa.id_punto
            and r.punto_b = pb.id_punto for json path
    )
select @lines as lines return
declare @circunferences nvarchar(max)
set @circunferences = (
        select c.id_circunferencia as 'circunferencia.id_circunferencia',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from circunferencia c
            inner join punto p on c.centro = p.id_punto for json path
    )
select @circunferences as circunferences return
declare @elipses nvarchar(max)
set @elipses = (
        select e.id_elipse as 'elipse.id_elipse',
            e.a as 'elipse.a',
            e.b as 'elipse.b',
            e.eje_focal as 'elipse.eje_focal',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from elipse e
            inner join punto p on e.centro = p.id_punto for json path
    )
select @elipses as elipses return
declare @hiperbolas nvarchar(max)
set @hiperbolas = (
        select h.id_hiperbola as 'hiperbola.id_hiperbola',
            h.a as 'hiperbola.a',
            h.b as 'hiperbola.b',
            h.eje_focal as 'hiperbola.eje_focal',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from hiperbola h
            inner join punto p on h.centro = p.id_punto for json path
    )
select @hiperbolas as hiperbolas return
declare @parabolas nvarchar(max)
set @parabolas = (
        select p.id_parabola as 'parabola.id_parabola',
            p.p as 'parabola.p',
            p.eje_focal as 'parabola.eje_focal',
            v.id_punto as 'vertice.id_punto',
            v.coord_x as 'vertice.coord_x',
            v.coord_y as 'vertice.coord_y'
        from parabola p
            inner join punto v on p.vertice = v.id_punto for json path
    )
select @parabolas as parabolas return
select p.id_punto,
    p.coord_x,
    p.coord_y
from punto p
where p.id_punto = 40 for json path;
select r.id_recta as 'recta.id_recta',
    pa.id_punto as 'punto_a.id_punto',
    pa.coord_x as 'punto_a.coord_x',
    pa.coord_y as 'punto_a.coord_y',
    pb.id_punto 'punto_b.id_punto',
    pb.coord_x as 'punto_b.coord_x',
    pb.coord_y as 'punto_b.coord_y'
from punto pa,
    recta r,
    punto pb
where r.punto_a = pa.id_punto
    and r.punto_b = pb.id_punto
    and r.id_recta = 1 for json path;
select c.id_circunferencia as 'circunferencia.id_circunferencia',
    p.id_punto as 'centro.id_punto',
    p.coord_x as 'centro.coord_x',
    p.coord_y as 'centro.coord_y'
from circunferencia c
    inner join punto p on c.centro = p.id_punto
    and c.id_circunferencia = 1 for json path;
select e.id_elipse as 'elipse.id_elipse',
    e.a as 'elipse.a',
    e.b as 'elipse.b',
    e.eje_focal as 'elipse.eje_focal',
    p.id_punto as 'centro.id_punto',
    p.coord_x as 'centro.coord_x',
    p.coord_y as 'centro.coord_y'
from elipse e
    inner join punto p on e.centro = p.id_punto
    and e.id_elipse = 1 for json path;
select h.id_hiperbola as 'hiperbola.id_hiperbola',
    h.a as 'hiperbola.a',
    h.b as 'hiperbola.b',
    h.eje_focal as 'hiperbola.eje_focal',
    p.id_punto as 'centro.id_punto',
    p.coord_x as 'centro.coord_x',
    p.coord_y as 'centro.coord_y'
from hiperbola h
    inner join punto p on h.centro = p.id_punto
    and h.id_hiperbola = 1 for json path;
select p.id_parabola as 'parabola.id_parabola',
    p.p as 'parabola.p',
    p.eje_focal as 'parabola.eje_focal',
    v.id_punto as 'vertice.id_punto',
    v.coord_x as 'vertice.coord_x',
    v.coord_y as 'vertice.coord_y'
from parabola p
    inner join punto v on p.vertice = v.id_punto
    and p.id_parabola = 1 for json path;
insert into parabola (vertice, p, eje_focal)
values (4, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (16, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (23, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (4, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (13, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (2, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (11, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (23, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (8, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (7, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (18, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (24, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (1, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (4, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (19, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (18, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (5, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (13, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (7, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (2, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (25, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (3, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (21, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (13, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (4, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (9, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (4, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (13, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (4, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (17, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (11, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (13, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (21, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (24, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (9, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (17, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (3, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (1, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (1, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (20, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (7, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (15, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (21, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (6, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (19, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (16, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (5, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (5, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (18, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (21, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (18, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (25, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (13, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (9, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (11, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (25, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (12, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (16, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (19, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (17, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (2, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (25, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (23, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (4, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (17, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (16, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (16, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (2, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (2, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (2, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (18, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (14, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (13, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (23, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (19, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (16, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (9, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (24, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (5, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (24, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (17, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (18, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (10, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (20, 20.0, 'x');
insert into parabola (vertice, p, eje_focal)
values (2, 20.0, 'y');
insert into parabola (vertice, p, eje_focal)
values (20, 20.0, 'y');
insert into recta (punto_a, punto_b)
values (20, 20);
insert into recta (punto_a, punto_b)
values (18, 20);
insert into recta (punto_a, punto_b)
values (23, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into recta (punto_a, punto_b)
values (3, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into recta (punto_a, punto_b)
values (12, 20);
insert into recta (punto_a, punto_b)
values (15, 20);
insert into recta (punto_a, punto_b)
values (22, 20);
insert into recta (punto_a, punto_b)
values (6, 20);
insert into recta (punto_a, punto_b)
values (8, 20);
insert into recta (punto_a, punto_b)
values (11, 20);
insert into recta (punto_a, punto_b)
values (21, 20);
insert into recta (punto_a, punto_b)
values (10, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (16, 20);
insert into recta (punto_a, punto_b)
values (22, 20);
insert into recta (punto_a, punto_b)
values (19, 20);
insert into recta (punto_a, punto_b)
values (20, 20);
insert into recta (punto_a, punto_b)
values (8, 20);
insert into recta (punto_a, punto_b)
values (23, 20);
insert into recta (punto_a, punto_b)
values (7, 20);
insert into recta (punto_a, punto_b)
values (12, 20);
insert into recta (punto_a, punto_b)
values (14, 20);
insert into recta (punto_a, punto_b)
values (22, 20);
insert into recta (punto_a, punto_b)
values (25, 20);
insert into recta (punto_a, punto_b)
values (18, 20);
insert into recta (punto_a, punto_b)
values (14, 20);
insert into recta (punto_a, punto_b)
values (9, 20);
insert into recta (punto_a, punto_b)
values (24, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (4, 20);
insert into recta (punto_a, punto_b)
values (15, 20);
insert into recta (punto_a, punto_b)
values (7, 20);
insert into recta (punto_a, punto_b)
values (25, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (22, 20);
insert into recta (punto_a, punto_b)
values (12, 20);
insert into recta (punto_a, punto_b)
values (24, 20);
insert into recta (punto_a, punto_b)
values (21, 20);
insert into recta (punto_a, punto_b)
values (3, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into recta (punto_a, punto_b)
values (9, 20);
insert into recta (punto_a, punto_b)
values (9, 20);
insert into recta (punto_a, punto_b)
values (1, 20);
insert into recta (punto_a, punto_b)
values (17, 20);
insert into recta (punto_a, punto_b)
values (3, 20);
insert into recta (punto_a, punto_b)
values (11, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (9, 20);
insert into recta (punto_a, punto_b)
values (15, 20);
insert into recta (punto_a, punto_b)
values (21, 20);
insert into recta (punto_a, punto_b)
values (10, 20);
insert into recta (punto_a, punto_b)
values (4, 20);
insert into recta (punto_a, punto_b)
values (4, 20);
insert into recta (punto_a, punto_b)
values (7, 20);
insert into recta (punto_a, punto_b)
values (23, 20);
insert into recta (punto_a, punto_b)
values (11, 20);
insert into recta (punto_a, punto_b)
values (3, 20);
insert into recta (punto_a, punto_b)
values (1, 20);
insert into recta (punto_a, punto_b)
values (22, 20);
insert into recta (punto_a, punto_b)
values (1, 20);
insert into recta (punto_a, punto_b)
values (4, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into recta (punto_a, punto_b)
values (6, 20);
insert into recta (punto_a, punto_b)
values (16, 20);
insert into recta (punto_a, punto_b)
values (12, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into recta (punto_a, punto_b)
values (16, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (4, 20);
insert into recta (punto_a, punto_b)
values (15, 20);
insert into recta (punto_a, punto_b)
values (14, 20);
insert into recta (punto_a, punto_b)
values (1, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (20, 20);
insert into recta (punto_a, punto_b)
values (22, 20);
insert into recta (punto_a, punto_b)
values (5, 20);
insert into recta (punto_a, punto_b)
values (17, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into recta (punto_a, punto_b)
values (14, 20);
insert into recta (punto_a, punto_b)
values (11, 20);
insert into recta (punto_a, punto_b)
values (12, 20);
insert into recta (punto_a, punto_b)
values (19, 20);
insert into recta (punto_a, punto_b)
values (14, 20);
insert into recta (punto_a, punto_b)
values (14, 20);
insert into recta (punto_a, punto_b)
values (3, 20);
insert into recta (punto_a, punto_b)
values (25, 20);
insert into recta (punto_a, punto_b)
values (21, 20);
insert into recta (punto_a, punto_b)
values (1, 20);
insert into recta (punto_a, punto_b)
values (12, 20);
insert into recta (punto_a, punto_b)
values (20, 20);
insert into recta (punto_a, punto_b)
values (15, 20);
insert into recta (punto_a, punto_b)
values (23, 20);
insert into recta (punto_a, punto_b)
values (15, 20);
insert into recta (punto_a, punto_b)
values (12, 20);
insert into recta (punto_a, punto_b)
values (4, 20);
insert into recta (punto_a, punto_b)
values (13, 20);
insert into circunferencia (centro, radio)
values (9, 18.65);
insert into circunferencia (centro, radio)
values (9, 3.54);
insert into circunferencia (centro, radio)
values (5, 9.69);
insert into circunferencia (centro, radio)
values (1, 6.56);
insert into circunferencia (centro, radio)
values (7, 3.01);
insert into circunferencia (centro, radio)
values (15, 14.05);
insert into circunferencia (centro, radio)
values (8, 0.24);
insert into circunferencia (centro, radio)
values (13, 14.36);
insert into circunferencia (centro, radio)
values (14, 11.56);
insert into circunferencia (centro, radio)
values (2, 9.09);
insert into circunferencia (centro, radio)
values (22, 11.77);
insert into circunferencia (centro, radio)
values (9, 15.98);
insert into circunferencia (centro, radio)
values (1, 7.81);
insert into circunferencia (centro, radio)
values (11, 6.25);
insert into circunferencia (centro, radio)
values (8, 4.03);
insert into circunferencia (centro, radio)
values (23, 17.04);
insert into circunferencia (centro, radio)
values (3, 1.77);
insert into circunferencia (centro, radio)
values (21, 12.26);
insert into circunferencia (centro, radio)
values (23, 11.84);
insert into circunferencia (centro, radio)
values (25, 3.35);
insert into circunferencia (centro, radio)
values (17, 19.52);
insert into circunferencia (centro, radio)
values (1, 3.37);
insert into circunferencia (centro, radio)
values (19, 11.99);
insert into circunferencia (centro, radio)
values (1, 12.12);
insert into circunferencia (centro, radio)
values (19, 7.07);
insert into circunferencia (centro, radio)
values (24, 19.39);
insert into circunferencia (centro, radio)
values (14, 11.77);
insert into circunferencia (centro, radio)
values (18, 1.1);
insert into circunferencia (centro, radio)
values (11, 14.79);
insert into circunferencia (centro, radio)
values (15, 4.05);
insert into circunferencia (centro, radio)
values (9, 18.94);
insert into circunferencia (centro, radio)
values (15, 7.24);
insert into circunferencia (centro, radio)
values (11, 14.43);
insert into circunferencia (centro, radio)
values (9, 0.13);
insert into circunferencia (centro, radio)
values (8, 17.63);
insert into circunferencia (centro, radio)
values (24, 4.92);
insert into circunferencia (centro, radio)
values (8, 5.38);
insert into circunferencia (centro, radio)
values (24, 14.37);
insert into circunferencia (centro, radio)
values (4, 13.62);
insert into circunferencia (centro, radio)
values (13, 11.28);
insert into circunferencia (centro, radio)
values (23, 8.59);
insert into circunferencia (centro, radio)
values (12, 5.56);
insert into circunferencia (centro, radio)
values (18, 3.47);
insert into circunferencia (centro, radio)
values (13, 16.14);
insert into circunferencia (centro, radio)
values (18, 12.91);
insert into circunferencia (centro, radio)
values (24, 12.71);
insert into circunferencia (centro, radio)
values (18, 15.67);
insert into circunferencia (centro, radio)
values (2, 5.51);
insert into circunferencia (centro, radio)
values (8, 14.06);
insert into circunferencia (centro, radio)
values (19, 17.92);
insert into circunferencia (centro, radio)
values (9, 19.0);
insert into circunferencia (centro, radio)
values (12, 9.01);
insert into circunferencia (centro, radio)
values (25, 19.41);
insert into circunferencia (centro, radio)
values (4, 18.63);
insert into circunferencia (centro, radio)
values (7, 9.21);
insert into circunferencia (centro, radio)
values (18, 17.49);
insert into circunferencia (centro, radio)
values (16, 14.65);
insert into circunferencia (centro, radio)
values (15, 11.05);
insert into circunferencia (centro, radio)
values (20, 11.86);
insert into circunferencia (centro, radio)
values (12, 11.58);
insert into circunferencia (centro, radio)
values (23, 3.59);
insert into circunferencia (centro, radio)
values (22, 15.77);
insert into circunferencia (centro, radio)
values (23, 13.69);
insert into circunferencia (centro, radio)
values (1, 2.83);
insert into circunferencia (centro, radio)
values (12, 14.27);
insert into circunferencia (centro, radio)
values (25, 4.87);
insert into circunferencia (centro, radio)
values (1, 11.26);
insert into circunferencia (centro, radio)
values (25, 9.92);
insert into circunferencia (centro, radio)
values (21, 11.38);
insert into circunferencia (centro, radio)
values (1, 3.59);
insert into circunferencia (centro, radio)
values (24, 19.84);
insert into circunferencia (centro, radio)
values (6, 15.46);
insert into circunferencia (centro, radio)
values (3, 4.04);
insert into circunferencia (centro, radio)
values (17, 6.24);
insert into circunferencia (centro, radio)
values (12, 14.0);
insert into circunferencia (centro, radio)
values (4, 17.14);
insert into circunferencia (centro, radio)
values (16, 10.31);
insert into circunferencia (centro, radio)
values (12, 11.19);
insert into circunferencia (centro, radio)
values (2, 5.21);
insert into circunferencia (centro, radio)
values (16, 18.31);
insert into circunferencia (centro, radio)
values (9, 3.89);
insert into circunferencia (centro, radio)
values (13, 8.58);
insert into circunferencia (centro, radio)
values (23, 16.58);
insert into circunferencia (centro, radio)
values (2, 7.72);
insert into circunferencia (centro, radio)
values (24, 16.98);
insert into circunferencia (centro, radio)
values (15, 12.72);
insert into circunferencia (centro, radio)
values (1, 18.47);
insert into circunferencia (centro, radio)
values (25, 19.56);
insert into circunferencia (centro, radio)
values (12, 4.59);
insert into circunferencia (centro, radio)
values (6, 7.17);
insert into circunferencia (centro, radio)
values (11, 10.46);
insert into circunferencia (centro, radio)
values (23, 3.03);
insert into circunferencia (centro, radio)
values (2, 15.12);
insert into circunferencia (centro, radio)
values (17, 5.77);
insert into circunferencia (centro, radio)
values (14, 10.8);
insert into circunferencia (centro, radio)
values (14, 7.79);
insert into circunferencia (centro, radio)
values (18, 16.27);
insert into circunferencia (centro, radio)
values (6, 4.92);
insert into circunferencia (centro, radio)
values (8, 8.18);
insert into circunferencia (centro, radio)
values (19, 15.9);
insert into elipse (centro, a, b, eje_focal)
values (8, 22.93, 15.94, 'x');
insert into elipse (centro, a, b, eje_focal)
values (2, 24.18, 18.23, 'x');
insert into elipse (centro, a, b, eje_focal)
values (5, 24.47, 15.35, 'y');
insert into elipse (centro, a, b, eje_focal)
values (4, 21.93, 15.34, 'x');
insert into elipse (centro, a, b, eje_focal)
values (5, 23.58, 15.57, 'y');
insert into elipse (centro, a, b, eje_focal)
values (11, 23.14, 17.77, 'y');
insert into elipse (centro, a, b, eje_focal)
values (1, 22.68, 17.44, 'x');
insert into elipse (centro, a, b, eje_focal)
values (13, 24.28, 15.42, 'x');
insert into elipse (centro, a, b, eje_focal)
values (16, 23.41, 17.03, 'y');
insert into elipse (centro, a, b, eje_focal)
values (11, 23.73, 18.19, 'x');
insert into elipse (centro, a, b, eje_focal)
values (17, 22.46, 19.89, 'y');
insert into elipse (centro, a, b, eje_focal)
values (1, 21.29, 15.95, 'y');
insert into elipse (centro, a, b, eje_focal)
values (17, 22.89, 15.94, 'y');
insert into elipse (centro, a, b, eje_focal)
values (5, 24.66, 18.13, 'y');
insert into elipse (centro, a, b, eje_focal)
values (20, 24.57, 18.05, 'x');
insert into elipse (centro, a, b, eje_focal)
values (25, 24.89, 19.44, 'x');
insert into elipse (centro, a, b, eje_focal)
values (4, 22.25, 16.58, 'y');
insert into elipse (centro, a, b, eje_focal)
values (12, 24.48, 18.48, 'y');
insert into elipse (centro, a, b, eje_focal)
values (10, 23.64, 16.92, 'y');
insert into elipse (centro, a, b, eje_focal)
values (13, 23.06, 19.33, 'y');
insert into elipse (centro, a, b, eje_focal)
values (4, 22.59, 17.77, 'x');
insert into elipse (centro, a, b, eje_focal)
values (13, 21.6, 16.46, 'x');
insert into elipse (centro, a, b, eje_focal)
values (13, 21.83, 17.81, 'x');
insert into elipse (centro, a, b, eje_focal)
values (7, 24.34, 16.9, 'y');
insert into elipse (centro, a, b, eje_focal)
values (24, 21.3, 18.68, 'y');
insert into elipse (centro, a, b, eje_focal)
values (16, 23.61, 15.33, 'x');
insert into elipse (centro, a, b, eje_focal)
values (8, 21.78, 18.0, 'y');
insert into elipse (centro, a, b, eje_focal)
values (23, 23.06, 18.37, 'y');
insert into elipse (centro, a, b, eje_focal)
values (20, 23.27, 19.5, 'x');
insert into elipse (centro, a, b, eje_focal)
values (13, 24.6, 15.72, 'y');
insert into elipse (centro, a, b, eje_focal)
values (25, 24.52, 18.22, 'x');
insert into elipse (centro, a, b, eje_focal)
values (4, 21.01, 15.84, 'y');
insert into elipse (centro, a, b, eje_focal)
values (8, 23.76, 19.15, 'x');
insert into elipse (centro, a, b, eje_focal)
values (14, 24.18, 16.17, 'y');
insert into elipse (centro, a, b, eje_focal)
values (20, 23.6, 17.08, 'x');
insert into elipse (centro, a, b, eje_focal)
values (20, 22.12, 17.9, 'x');
insert into elipse (centro, a, b, eje_focal)
values (12, 22.34, 17.29, 'x');
insert into elipse (centro, a, b, eje_focal)
values (3, 23.36, 16.08, 'x');
insert into elipse (centro, a, b, eje_focal)
values (16, 23.91, 19.03, 'x');
insert into elipse (centro, a, b, eje_focal)
values (20, 24.29, 15.61, 'x');
insert into elipse (centro, a, b, eje_focal)
values (18, 23.15, 17.81, 'y');
insert into elipse (centro, a, b, eje_focal)
values (16, 23.88, 19.84, 'x');
insert into elipse (centro, a, b, eje_focal)
values (12, 23.91, 17.42, 'x');
insert into elipse (centro, a, b, eje_focal)
values (9, 22.75, 19.26, 'x');
insert into elipse (centro, a, b, eje_focal)
values (22, 23.77, 18.39, 'y');
insert into elipse (centro, a, b, eje_focal)
values (7, 24.61, 18.73, 'x');
insert into elipse (centro, a, b, eje_focal)
values (7, 24.47, 19.01, 'x');
insert into elipse (centro, a, b, eje_focal)
values (22, 22.77, 15.19, 'y');
insert into elipse (centro, a, b, eje_focal)
values (20, 23.95, 15.11, 'x');
insert into elipse (centro, a, b, eje_focal)
values (9, 22.42, 18.58, 'y');
insert into elipse (centro, a, b, eje_focal)
values (12, 21.9, 16.52, 'x');
insert into elipse (centro, a, b, eje_focal)
values (22, 23.19, 19.75, 'y');
insert into elipse (centro, a, b, eje_focal)
values (4, 24.23, 18.71, 'y');
insert into elipse (centro, a, b, eje_focal)
values (3, 23.61, 19.24, 'x');
insert into elipse (centro, a, b, eje_focal)
values (25, 21.54, 17.08, 'x');
insert into elipse (centro, a, b, eje_focal)
values (21, 23.56, 17.02, 'y');
insert into elipse (centro, a, b, eje_focal)
values (24, 23.06, 19.04, 'x');
insert into elipse (centro, a, b, eje_focal)
values (7, 23.0, 15.3, 'y');
insert into elipse (centro, a, b, eje_focal)
values (2, 22.55, 17.5, 'x');
insert into elipse (centro, a, b, eje_focal)
values (24, 24.25, 18.9, 'y');
insert into elipse (centro, a, b, eje_focal)
values (23, 24.06, 16.34, 'x');
insert into elipse (centro, a, b, eje_focal)
values (2, 23.77, 18.29, 'x');
insert into elipse (centro, a, b, eje_focal)
values (11, 22.86, 18.17, 'x');
insert into elipse (centro, a, b, eje_focal)
values (3, 21.52, 16.49, 'y');
insert into elipse (centro, a, b, eje_focal)
values (23, 24.91, 16.92, 'x');
insert into elipse (centro, a, b, eje_focal)
values (1, 23.16, 16.89, 'y');
insert into elipse (centro, a, b, eje_focal)
values (9, 24.07, 19.01, 'y');
insert into elipse (centro, a, b, eje_focal)
values (4, 24.27, 17.41, 'y');
insert into elipse (centro, a, b, eje_focal)
values (25, 22.01, 17.36, 'y');
insert into elipse (centro, a, b, eje_focal)
values (2, 23.4, 17.66, 'y');
insert into elipse (centro, a, b, eje_focal)
values (3, 21.07, 16.55, 'x');
insert into elipse (centro, a, b, eje_focal)
values (15, 23.6, 15.76, 'x');
insert into elipse (centro, a, b, eje_focal)
values (6, 21.75, 15.2, 'x');
insert into elipse (centro, a, b, eje_focal)
values (12, 21.47, 16.26, 'x');
insert into elipse (centro, a, b, eje_focal)
values (1, 22.51, 16.24, 'y');
insert into elipse (centro, a, b, eje_focal)
values (8, 21.93, 18.49, 'x');
insert into elipse (centro, a, b, eje_focal)
values (7, 24.3, 18.21, 'y');
insert into elipse (centro, a, b, eje_focal)
values (16, 21.07, 17.78, 'x');
insert into elipse (centro, a, b, eje_focal)
values (21, 21.06, 18.03, 'y');
insert into elipse (centro, a, b, eje_focal)
values (3, 23.41, 17.86, 'x');
insert into elipse (centro, a, b, eje_focal)
values (16, 24.24, 15.89, 'x');
insert into elipse (centro, a, b, eje_focal)
values (19, 23.31, 17.37, 'x');
insert into elipse (centro, a, b, eje_focal)
values (2, 23.76, 19.93, 'x');
insert into elipse (centro, a, b, eje_focal)
values (20, 22.94, 15.74, 'x');
insert into elipse (centro, a, b, eje_focal)
values (23, 21.94, 15.8, 'y');
insert into elipse (centro, a, b, eje_focal)
values (25, 21.97, 18.51, 'x');
insert into elipse (centro, a, b, eje_focal)
values (8, 22.09, 20.0, 'y');
insert into elipse (centro, a, b, eje_focal)
values (23, 22.26, 15.99, 'x');
insert into elipse (centro, a, b, eje_focal)
values (24, 23.09, 17.88, 'x');
insert into elipse (centro, a, b, eje_focal)
values (13, 21.79, 19.37, 'x');
insert into elipse (centro, a, b, eje_focal)
values (5, 23.54, 19.05, 'x');
insert into elipse (centro, a, b, eje_focal)
values (21, 22.39, 19.44, 'x');
insert into elipse (centro, a, b, eje_focal)
values (3, 24.67, 19.13, 'y');
insert into elipse (centro, a, b, eje_focal)
values (20, 22.51, 18.77, 'x');
insert into elipse (centro, a, b, eje_focal)
values (12, 24.12, 19.7, 'y');
insert into elipse (centro, a, b, eje_focal)
values (18, 24.47, 17.66, 'x');
insert into elipse (centro, a, b, eje_focal)
values (1, 22.7, 15.3, 'y');
insert into elipse (centro, a, b, eje_focal)
values (18, 21.81, 18.23, 'x');
insert into elipse (centro, a, b, eje_focal)
values (4, 22.42, 16.18, 'y');
insert into elipse (centro, a, b, eje_focal)
values (17, 22.32, 15.09, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (6, 21.42, 16.54, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (22, 23.23, 18.35, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (19, 21.71, 19.78, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (16, 22.25, 15.76, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (7, 23.58, 17.3, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (24, 22.66, 16.93, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 21.25, 15.21, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (8, 24.73, 18.66, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (2, 21.56, 18.73, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (3, 21.7, 18.11, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (4, 24.7, 15.78, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (13, 21.55, 18.84, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (10, 23.85, 16.98, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (18, 21.27, 17.66, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (7, 22.15, 18.72, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 21.18, 16.66, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (4, 22.5, 16.63, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (11, 24.02, 15.28, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (18, 22.68, 18.04, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (11, 22.04, 18.06, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (14, 24.6, 17.81, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (2, 24.68, 16.01, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (15, 22.34, 16.1, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (15, 22.07, 16.62, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (13, 23.4, 16.41, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (2, 23.15, 15.01, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (4, 21.53, 18.65, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (20, 22.98, 18.87, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (2, 21.8, 17.29, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (19, 21.87, 17.9, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (8, 24.39, 19.42, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (18, 21.81, 16.4, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (17, 22.06, 18.62, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (11, 23.23, 19.98, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (8, 22.17, 19.63, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (11, 22.59, 15.19, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (8, 24.34, 16.44, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (21, 24.13, 18.78, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (15, 21.79, 16.3, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 22.28, 18.73, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (24, 22.06, 16.39, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (15, 22.26, 19.59, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (20, 24.48, 17.31, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (7, 23.34, 15.86, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (11, 24.69, 16.09, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (25, 23.67, 19.39, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (1, 24.1, 15.76, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (18, 21.09, 20.0, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (18, 21.15, 17.68, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (10, 23.21, 16.88, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (12, 24.95, 17.12, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (4, 21.0, 15.82, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (21, 23.34, 17.85, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (1, 21.81, 16.98, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (1, 21.27, 15.0, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (24, 22.2, 19.5, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (13, 22.79, 16.57, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (25, 24.18, 17.2, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (17, 22.11, 17.9, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (5, 23.86, 15.49, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 24.07, 17.53, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (4, 23.51, 15.67, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (17, 24.69, 19.23, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (23, 23.05, 18.43, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (21, 24.92, 16.06, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (7, 22.64, 18.49, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (6, 21.83, 19.66, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (1, 24.54, 16.0, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (16, 22.47, 16.9, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (20, 23.81, 15.6, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (15, 24.97, 15.88, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (14, 22.98, 17.6, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (4, 21.42, 15.85, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (20, 22.27, 19.94, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (23, 22.3, 18.5, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 22.74, 16.49, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 23.52, 17.56, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (5, 23.9, 19.2, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (3, 23.21, 17.95, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (17, 21.58, 16.09, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (22, 23.22, 18.64, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (12, 24.07, 19.41, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 24.56, 17.07, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (12, 23.6, 19.72, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (15, 23.99, 15.61, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (23, 22.06, 18.13, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (5, 21.18, 17.38, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (6, 21.76, 18.94, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (13, 21.03, 17.92, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (1, 21.74, 15.55, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (9, 23.86, 18.54, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (13, 21.21, 19.16, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (11, 24.24, 18.43, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (2, 22.69, 17.3, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (22, 24.23, 19.9, 'x');
insert into hiperbola (centro, a, b, eje_focal)
values (20, 24.24, 17.51, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (1, 24.23, 19.62, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (21, 24.35, 19.42, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (2, 23.89, 15.08, 'y');
insert into hiperbola (centro, a, b, eje_focal)
values (19, 21.09, 15.37, 'y');
go create procedure get_points as
declare @point nvarchar(max)
set @point = (
        select p.id_punto,
            p.coord_x,
            p.coord_y
        from punto p for json path
    )
select @point as points return
go create procedure get_lines as
declare @lines nvarchar(max)
set @lines = (
        select r.id_recta as 'recta.id_recta',
            pa.id_punto as 'punto_a.id_punto',
            pa.coord_x as 'punto_a.coord_x',
            pa.coord_y as 'punto_a.coord_y',
            pb.id_punto 'punto_b.id_punto',
            pb.coord_x as 'punto_b.coord_x',
            pb.coord_y as 'punto_b.coord_y'
        from punto pa,
            recta r,
            punto pb
        where r.punto_a = pa.id_punto
            and r.punto_b = pb.id_punto for json path
    )
select @lines as lines return
go create procedure get_circunferences as
declare @circunferences nvarchar(max)
set @circunferences = (
        select c.id_circunferencia as 'circunferencia.id_circunferencia',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from circunferencia c
            inner join punto p on c.centro = p.id_punto for json path
    )
select @circunferences as circunferences return
go create procedure get_elipses as
declare @elipses nvarchar(max)
set @elipses = (
        select e.id_elipse as 'elipse.id_elipse',
            e.a as 'elipse.a',
            e.b as 'elipse.b',
            e.eje_focal as 'elipse.eje_focal',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from elipse e
            inner join punto p on e.centro = p.id_punto for json path
    )
select @elipses as elipses return
go create procedure get_hiperbolas as
declare @hiperbolas nvarchar(max)
set @hiperbolas = (
        select h.id_hiperbola as 'hiperbola.id_hiperbola',
            h.a as 'hiperbola.a',
            h.b as 'hiperbola.b',
            h.eje_focal as 'hiperbola.eje_focal',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from hiperbola h
            inner join punto p on h.centro = p.id_punto for json path
    )
select @hiperbolas as hiperbolas return
go create procedure get_parabolas as
declare @parabolas nvarchar(max)
set @parabolas = (
        select p.id_parabola as 'parabola.id_parabola',
            p.p as 'parabola.p',
            p.eje_focal as 'parabola.eje_focal',
            v.id_punto as 'vertice.id_punto',
            v.coord_x as 'vertice.coord_x',
            v.coord_y as 'vertice.coord_y'
        from parabola p
            inner join punto v on p.vertice = v.id_punto for json path
    )
select @parabolas as parabolas return exec get_parabolas
go create procedure get_point @id integer as
declare @punto nvarchar(255)
set @punto = (
        select p.id_punto,
            p.coord_x,
            p.coord_y
        from punto p
        where p.id_punto = @id for json path
    )
select @punto as punto return
go create procedure get_line @id integer as
declare @line nvarchar(255)
set @line = (
        select r.id_recta as 'recta.id_recta',
            pa.id_punto as 'punto_a.id_punto',
            pa.coord_x as 'punto_a.coord_x',
            pa.coord_y as 'punto_a.coord_y',
            pb.id_punto 'punto_b.id_punto',
            pb.coord_x as 'punto_b.coord_x',
            pb.coord_y as 'punto_b.coord_y'
        from punto pa,
            recta r,
            punto pb
        where r.punto_a = pa.id_punto
            and r.punto_b = pb.id_punto
            and r.id_recta = @id for json path
    )
select @line as line return
go create procedure get_circunference @id integer as
declare @circunference nvarchar(255)
set @circunference = (
        select c.id_circunferencia as 'circunferencia.id_circunferencia',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from circunferencia c
            inner join punto p on c.centro = p.id_punto
            and c.id_circunferencia = @id for json path
    )
select @circunference as circunference return
go create procedure get_elipse @id integer as
declare @elipse nvarchar(255)
set @elipse = (
        select e.id_elipse as 'elipse.id_elipse',
            e.a as 'elipse.a',
            e.b as 'elipse.b',
            e.eje_focal as 'elipse.eje_focal',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from elipse e
            inner join punto p on e.centro = p.id_punto
            and e.id_elipse = @id for json path
    )
select @elipse as elipse return
go create procedure get_hiperbola @id integer as
declare @hiperbola nvarchar(255)
set @hiperbola = (
        select h.id_hiperbola as 'hiperbola.id_hiperbola',
            h.a as 'hiperbola.a',
            h.b as 'hiperbola.b',
            h.eje_focal as 'hiperbola.eje_focal',
            p.id_punto as 'centro.id_punto',
            p.coord_x as 'centro.coord_x',
            p.coord_y as 'centro.coord_y'
        from hiperbola h
            inner join punto p on h.centro = p.id_punto
            and h.id_hiperbola = @id for json path
    )
select @hiperbola as hiperbola return
go create procedure get_parabola @id integer as
declare @parabola nvarchar(255)
set @parabola = (
        select p.id_parabola as 'parabola.id_parabola',
            p.p as 'parabola.p',
            p.eje_focal as 'parabola.eje_focal',
            v.id_punto as 'vertice.id_punto',
            v.coord_x as 'vertice.coord_x',
            v.coord_y as 'vertice.coord_y'
        from parabola p
            inner join punto v on p.vertice = v.id_punto
            and p.id_parabola = @id for json path
    )
select @parabola as parabola return --////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    create view get_lines as
select r.id_recta as id,
    pa.id_punto as 'punto_a.id_punto',
    pa.coord_x as 'punto_a.coord_x',
    pa.coord_y as 'punto_a.coord_y',
    pb.id_punto 'punto_b.id_punto',
    pb.coord_x as 'punto_b.coord_x',
    pb.coord_y as 'punto_b.coord_y'
from punto pa,
    recta r,
    punto pb
where r.punto_a = pa.id_punto
    and r.punto_b = pb.id_punto;
select *
from get_lines;
create view get_circunferences as
select c.id_circunferencia as id,
    c.radio as "circunferencia.radio",
    p.id_punto as 'centro.id_punto',
    p.coord_x as 'centro.coord_x',
    p.coord_y as 'centro.coord_y'
from circunferencia c
    inner join punto p on c.centro = p.id_punto;
create view get_elipses as
select e.id_elipse as id,
    e.a as 'elipse.a',
    e.b as 'elipse.b',
    e.eje_focal as 'elipse.eje_focal',
    p.id_punto as 'centro.id_punto',
    p.coord_x as 'centro.coord_x',
    p.coord_y as 'centro.coord_y'
from elipse e
    inner join punto p on e.centro = p.id_punto;
create view get_hiperbolas as
select h.id_hiperbola as id,
    h.a as 'hiperbola.a',
    h.b as 'hiperbola.b',
    h.eje_focal as 'hiperbola.eje_focal',
    p.id_punto as 'centro.id_punto',
    p.coord_x as 'centro.coord_x',
    p.coord_y as 'centro.coord_y'
from hiperbola h
    inner join punto p on h.centro = p.id_punto;
select *
from get_hiperbolas;
create view get_parabolas as
select p.id_parabola as id,
    p.p as 'parabola.p',
    p.eje_focal as 'parabola.eje_focal',
    v.id_punto as 'vertice.id_punto',
    v.coord_x as 'vertice.coord_x',
    v.coord_y as 'vertice.coord_y'
from parabola p
    inner join punto v on p.vertice = v.id_punto;
select *
from get_parabolas
where id = 1;
create view get_parabolas as
select p.id_parabola as id,
    p.p as 'parabola.p',
    p.eje_focal as 'parabola.eje_focal',
    v.id_punto as 'vertice.id_punto',
    v.coord_x as 'vertice.coord_x',
    v.coord_y as 'vertice.coord_y'
from parabola p
    inner join punto v on p.vertice = v.id_punto;
CREATE TABLE customer(
    id_customer INTEGER NOT NULL,
    first_name text(100) NOT NULL,
    last_name text(100) NOT NULL,
    email text(50) NOT NULL,
    phone text(15) NOT NULL,
    card_id text(13) UNIQUE NOT NULL,
    address text(100) NOT NULL,
    CONSTRAINT pk_idcustomer PRIMARY KEY(id_customer)
);
CREATE TABLE product(
    id_product text(15) NOT NULL,
    product_name text(100) NOT NULL,
    description text(100) NOT NULL,
    quantity INTEGER NOT NULL,
    price NUMERIC(12, 2) NOT NULL,
    iva NUMERIC(5, 2) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY(id_product)
);
CREATE TABLE invoice(
    id_invoice INTEGER NOT NULL,
    invoice_number text(20) UNIQUE NOT NULL,
    customer INTEGER NOT NULL,
    emission_date text NOT NULL,
    sub_total NUMERIC(12, 2) NOT NULL,
    iva NUMERIC(12, 2) NOT NULL,
    total numeric(12, 2) NOT NULL,
    CONSTRAINT pk_invoice PRIMARY KEY(id_invoice),
    CONSTRAINT fk_cust_inv FOREIGN KEY(customer) REFERENCES customer(id_customer)
);
CREATE TABLE invoice_detail(
    id_detail INTEGER NOT NULL,
    invoice INTEGER NOT NULL,
    product text(15) NOT NULL,
    quantity INTEGER NOT NULL,
    sub_total NUMERIC(12, 2) NOT NULL,
    iva NUMERIC(12, 2) NOT NULL,
    total numeric(12, 2) NOT NULL,
    CONSTRAINT pk_detail PRIMARY KEY(id_detail),
    CONSTRAINT fk_prod_det FOREIGN KEY(product) REFERENCES product(id_product),
    CONSTRAINT fk_inv_det FOREIGN KEY(invoice) REFERENCES invoice(id_invoice)
);
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Dorice',
        'Macken',
        'dmacken0@live.com',
        '454 615 8683',
        '9488567600',
        '30444 Vera Street'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Annabell',
        'Watsam',
        'awatsam1@a8.net',
        '492 779 1012',
        '8267618317',
        '134 Waywood Way'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Clay',
        'Margaritelli',
        'cmargaritelli2@trellian.com',
        '373 158 3744',
        '0350746036',
        '01 Mosinee Way'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Nicol',
        'Lewinton',
        'nlewinton3@google.nl',
        '254 885 8496',
        '5722083313',
        '5046 Hayes Trail'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Georgette',
        'Braunton',
        'gbraunton4@tamu.edu',
        '778 578 6199',
        '1813056072',
        '80 Pennsylvania Way'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Coop',
        'Harbinson',
        'charbinson5@ifeng.com',
        '106 772 3105',
        '8603067929',
        '41081 Weeping Birch Crossing'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Sofie',
        'Dufaur',
        'sdufaur6@mozilla.org',
        '376 588 8858',
        '3272735763',
        '9 Buell Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Lorelle',
        'Gilbanks',
        'lgilbanks7@bloomberg.com',
        '628 524 7331',
        '0255345747',
        '17 6th Center'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Zeb',
        'Swayte',
        'zswayte8@sbwire.com',
        '227 321 2682',
        '2476864854',
        '5 Namekagon Court'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Blaine',
        'Kalkofen',
        'bkalkofen9@oracle.com',
        '505 145 9202',
        '8901178109',
        '1783 Talmadge Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Celisse',
        'Bisp',
        'cbispa@naver.com',
        '551 537 5707',
        '8331645839',
        '50 Merry Parkway'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Berne',
        'Axtell',
        'baxtellb@issuu.com',
        '736 385 4722',
        '4209045691',
        '09 Green Hill'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Domenico',
        'Morrall',
        'dmorrallc@amazon.com',
        '796 952 3229',
        '5656680312',
        '843 7th Center'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Lura',
        'Mabbe',
        'lmabbed@github.io',
        '107 755 0438',
        '3351593384',
        '88384 Reinke Park'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Gusty',
        'Aubury',
        'gauburye@w3.org',
        '899 975 7143',
        '6255872823',
        '4641 Vahlen Circle'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Maxi',
        'Eckly',
        'mecklyf@foxnews.com',
        '726 429 7609',
        '1663925895',
        '7 Manufacturers Point'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Abel',
        'Gearty',
        'ageartyg@walmart.com',
        '996 186 9905',
        '7044045286',
        '864 Eggendart Parkway'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Norman',
        'Saich',
        'nsaichh@utexas.edu',
        '504 895 8414',
        '0846713519',
        '905 Meadow Ridge Terrace'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Roger',
        'Mosdell',
        'rmosdelli@themeforest.net',
        '974 109 8190',
        '5761593742',
        '88233 Colorado Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Isador',
        'Laroze',
        'ilarozej@deviantart.com',
        '248 272 7183',
        '2377999840',
        '22 Springs Place'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Ashlie',
        'Suarez',
        'asuarezk@amazon.co.uk',
        '779 956 8490',
        '1740333659',
        '303 Parkside Center'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Andria',
        'Annable',
        'aannablel@globo.com',
        '195 436 6359',
        '0058198695',
        '17785 Bay Circle'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Dietrich',
        'Gavrielly',
        'dgavriellym@princeton.edu',
        '516 401 6355',
        '4449643577',
        '7 Manufacturers Way'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Rene',
        'Rentz',
        'rrentzn@wsj.com',
        '134 831 9786',
        '6121808470',
        '52528 Gateway Trail'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Lyn',
        'McKea',
        'lmckeao@theglobeandmail.com',
        '364 174 3337',
        '2647713650',
        '604 Memorial Plaza'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Marnie',
        'Matthewson',
        'mmatthewsonp@umich.edu',
        '835 531 2279',
        '4779918723',
        '5886 Maple Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Guss',
        'Shoreson',
        'gshoresonq@1und1.de',
        '529 869 8109',
        '6254485176',
        '327 Warrior Junction'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Nisse',
        'Killich',
        'nkillichr@samsung.com',
        '289 434 4129',
        '5732113770',
        '815 Clarendon Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Taryn',
        'Feeny',
        'tfeenys@goodreads.com',
        '828 273 1689',
        '6635555951',
        '9397 Sutherland Terrace'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Christan',
        'Broinlich',
        'cbroinlicht@loc.gov',
        '882 676 8286',
        '9993858382',
        '428 Shasta Hill'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Karlis',
        'Hammond',
        'khammondu@seesaa.net',
        '357 547 8090',
        '6620644333',
        '50 Kingsford Junction'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Hermann',
        'Boone',
        'hboonev@ameblo.jp',
        '712 345 2695',
        '2190329779',
        '11868 Lukken Way'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Marybelle',
        'Sentance',
        'msentancew@sbwire.com',
        '542 934 0936',
        '2257552628',
        '999 Warner Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Gert',
        'Escreet',
        'gescreetx@typepad.com',
        '513 549 8921',
        '3205255097',
        '69 Onsgard Hill'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Saunders',
        'Godridge',
        'sgodridgey@jimdo.com',
        '128 577 0672',
        '8540830469',
        '96187 American Drive'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Palm',
        'Balchen',
        'pbalchenz@hatena.ne.jp',
        '433 414 8935',
        '8592872014',
        '43 Brickson Park Plaza'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Melosa',
        'Tejero',
        'mtejero10@bloglovin.com',
        '686 102 7828',
        '8967421982',
        '9 8th Street'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Pavia',
        'Meaton',
        'pmeaton11@alibaba.com',
        '981 352 4980',
        '3350507999',
        '633 Southridge Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Rickie',
        'Sapp',
        'rsapp12@washington.edu',
        '469 313 0766',
        '6764233586',
        '1191 Bluestem Plaza'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Brook',
        'Phettis',
        'bphettis13@themeforest.net',
        '736 931 7728',
        '8709290699',
        '6 Heffernan Avenue'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Janek',
        'Brantl',
        'jbrantl14@discuz.net',
        '845 502 8017',
        '2234541034',
        '815 Hallows Avenue'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Suzanne',
        'Ommanney',
        'sommanney15@e-recht24.de',
        '698 252 2886',
        '1997853493',
        '12 South Junction'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Brandy',
        'Busfield',
        'bbusfield16@zdnet.com',
        '382 602 5498',
        '2929291095',
        '312 Linden Road'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Hunfredo',
        'Lancastle',
        'hlancastle17@elegantthemes.com',
        '128 973 9702',
        '2057631338',
        '96 Debra Street'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Dunc',
        'Pidduck',
        'dpidduck18@ted.com',
        '738 691 1061',
        '2146577991',
        '140 Bobwhite Circle'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Amelie',
        'Garford',
        'agarford19@meetup.com',
        '679 837 3366',
        '5747902008',
        '30817 Ramsey Avenue'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Bronson',
        'Caughan',
        'bcaughan1a@bizjournals.com',
        '212 425 3360',
        '4516268094',
        '09004 Oxford Crossing'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Nicoli',
        'Shasnan',
        'nshasnan1b@si.edu',
        '957 428 4382',
        '5901047559',
        '17 Johnson Way'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Cody',
        'Lewzey',
        'clewzey1c@ca.gov',
        '934 988 8571',
        '2399558553',
        '94 Warner Junction'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Alexio',
        'Ockland',
        'aockland1d@eventbrite.com',
        '517 564 1399',
        '5697603541',
        '292 Pepper Wood Crossing'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Cully',
        'Claige',
        'cclaige1e@live.com',
        '160 570 1854',
        '9055430323',
        '0 Dryden Hill'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Ellyn',
        'Stivani',
        'estivani1f@fotki.com',
        '777 849 4996',
        '6408046754',
        '57225 Everett Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Feliks',
        'Newbegin',
        'fnewbegin1g@ustream.tv',
        '658 141 0721',
        '5260447441',
        '1 Glendale Trail'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Aurelie',
        'Serjeantson',
        'aserjeantson1h@epa.gov',
        '424 726 6882',
        '7702900164',
        '15462 Mallard Center'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Eva',
        'M''Quharge',
        'emquharge1i@myspace.com',
        '754 139 4792',
        '0185798659',
        '199 Valley Edge Trail'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Bil',
        'De Vaux',
        'bdevaux1j@163.com',
        '600 787 3016',
        '7765236970',
        '6162 Hintze Drive'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Marthe',
        'Bariball',
        'mbariball1k@vinaora.com',
        '621 445 6284',
        '4303849855',
        '98274 Buena Vista Alley'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Ralf',
        'Tocqueville',
        'rtocqueville1l@typepad.com',
        '939 734 8690',
        '2582138061',
        '7376 Arrowood Drive'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Pegeen',
        'Frenzel;',
        'pfrenzel1m@prnewswire.com',
        '542 496 6543',
        '2728087172',
        '78804 Manley Terrace'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Avis',
        'Osipov',
        'aosipov1n@hostgator.com',
        '670 910 5509',
        '0229876056',
        '43882 Dakota Road'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Allard',
        'Jopp',
        'ajopp1o@tumblr.com',
        '159 364 5904',
        '2245620666',
        '37642 Tomscot Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Elliott',
        'Lyford',
        'elyford1p@toplist.cz',
        '625 617 0620',
        '2586562828',
        '42488 Sherman Plaza'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Hercule',
        'Swindon',
        'hswindon1q@java.com',
        '891 497 4493',
        '3993545338',
        '593 Corben Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Mozelle',
        'Bloomer',
        'mbloomer1r@sbwire.com',
        '362 893 2083',
        '4256746250',
        '782 Browning Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Louella',
        'Sicely',
        'lsicely1s@unc.edu',
        '117 725 5872',
        '0620724234',
        '38852 Sunfield Parkway'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Madel',
        'Cardenas',
        'mcardenas1t@mozilla.com',
        '457 380 1329',
        '6796012607',
        '3012 John Wall Crossing'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Rorie',
        'Vido',
        'rvido1u@zimbio.com',
        '672 724 7806',
        '3966795205',
        '07000 Pond Drive'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Sollie',
        'Ivashnyov',
        'sivashnyov1v@squarespace.com',
        '302 738 2928',
        '3504390352',
        '4 Pleasure Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Roddie',
        'Willock',
        'rwillock1w@dropbox.com',
        '730 165 7011',
        '2696572615',
        '59504 Forest Terrace'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Harriette',
        'Flintoff',
        'hflintoff1x@foxnews.com',
        '413 787 6551',
        '4169007123',
        '93 Stang Crossing'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Charity',
        'Macenzy',
        'cmacenzy1y@ibm.com',
        '859 462 1357',
        '5026252427',
        '90381 Blue Bill Park Pass'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Philis',
        'Praundl',
        'ppraundl1z@indiatimes.com',
        '444 755 6873',
        '4018478623',
        '467 Sunfield Crossing'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Isobel',
        'Heale',
        'iheale20@goo.gl',
        '380 565 3804',
        '8034147117',
        '15254 Merchant Road'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Darryl',
        'Trodler',
        'dtrodler21@typepad.com',
        '978 361 1560',
        '3479769152',
        '77 Darwin Center'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Homerus',
        'Awmack',
        'hawmack22@economist.com',
        '600 886 7447',
        '3012633324',
        '232 Memorial Center'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Cesare',
        'Stonham',
        'cstonham23@symantec.com',
        '718 911 5767',
        '7498917327',
        '77 Del Sol Circle'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Barbra',
        'Ebsworth',
        'bebsworth24@un.org',
        '991 509 1329',
        '3402807785',
        '50 North Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Min',
        'Gundrey',
        'mgundrey25@ted.com',
        '246 933 6082',
        '3939915882',
        '19251 Anthes Hill'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Gilberto',
        'Derrett',
        'gderrett26@marriott.com',
        '112 822 5680',
        '3611645176',
        '41 Independence Alley'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Sherlock',
        'Coutts',
        'scoutts27@statcounter.com',
        '247 816 0666',
        '5944796316',
        '274 Crescent Oaks Parkway'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Mattie',
        'Wardrop',
        'mwardrop28@apache.org',
        '471 965 3437',
        '0321006224',
        '71728 Trailsway Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Halie',
        'Moodie',
        'hmoodie29@freewebs.com',
        '253 860 1326',
        '9972884392',
        '615 Garrison Parkway'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Bentley',
        'Geertje',
        'bgeertje2a@livejournal.com',
        '286 186 8589',
        '5250022243',
        '69 Butterfield Plaza'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Ring',
        'Berni',
        'rberni2b@google.nl',
        '110 636 4022',
        '5183205191',
        '80 Fisk Street'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Johny',
        'Freyn',
        'jfreyn2c@narod.ru',
        '136 892 1370',
        '9836155880',
        '6 Acker Hill'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Jacinthe',
        'McPhelim',
        'jmcphelim2d@unicef.org',
        '189 659 7226',
        '0321018117',
        '10 Eastwood Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Alejandrina',
        'Ringham',
        'aringham2e@archive.org',
        '397 353 2164',
        '1675292655',
        '73029 Claremont Park'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Marcus',
        'Cater',
        'mcater2f@cdc.gov',
        '556 622 3594',
        '7651894030',
        '3 Armistice Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Ilise',
        'Burel',
        'iburel2g@ameblo.jp',
        '222 323 1289',
        '0151460493',
        '15 Glendale Terrace'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Arlene',
        'Raywood',
        'araywood2h@i2i.jp',
        '356 767 2448',
        '1134362595',
        '42 Fair Oaks Park'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Helen-elizabeth',
        'Klaesson',
        'hklaesson2i@naver.com',
        '974 890 0642',
        '2835167714',
        '85001 2nd Terrace'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Solomon',
        'Moakler',
        'smoakler2j@state.tx.us',
        '703 982 7776',
        '9887722200',
        '44243 John Wall Point'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Tish',
        'Mountain',
        'tmountain2k@addtoany.com',
        '104 105 9237',
        '9843257650',
        '643 Holmberg Park'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Norry',
        'Raffeorty',
        'nraffeorty2l@addtoany.com',
        '636 459 4316',
        '9212525709',
        '75114 Weeping Birch Street'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Magnum',
        'Gentsch',
        'mgentsch2m@cafepress.com',
        '987 428 0521',
        '9513022919',
        '4937 Shasta Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Viviana',
        'Elson',
        'velson2n@unesco.org',
        '755 382 6390',
        '7047698884',
        '07 Reindahl Lane'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Melissa',
        'Wittleton',
        'mwittleton2o@adobe.com',
        '658 505 7783',
        '2138867811',
        '7466 Porter Point'
    );
insert into customer (
        first_name,
        last_name,
        email,
        phone,
        card_id,
        address
    )
values (
        'Cassandra',
        'Stango',
        'cstango2p@paginegialle.it',
        '546 324 1893',
        '7039135515',
        '91890 Troy Court'
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'NUS',
        'everyone Hand Sanitizer',
        'alcohol',
        19,
        30.93,
        12
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'SCHN',
        'Molds - Mold Mix 10',
        'Molds - Mold Mix 10',
        10,
        61.34,
        0
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values ('DPG', 'Didanosine', 'Didanosine', 24, 71.21, 12);
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'CLNS^G',
        'athletes foot',
        'Terbinafine Hydrochloride',
        16,
        45.75,
        0
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'CFCO',
        'BEAUTE INITIALE',
        'Energizing Multi-Protection Healthy Glow Fluid',
        21,
        35.07,
        0
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'ELOS',
        'CLE DE PEAU BEAUTE PW FOUNDATION s',
        'Octinoxate and Titanium dioxide',
        16,
        74.19,
        0
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'AMWD',
        'Citalopram',
        'citalopram',
        25,
        68.25,
        12
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'BANC',
        'Fem Relief',
        'Acetaminophen Pamabrom',
        9,
        78.85,
        12
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values (
        'GEC',
        'ACETAMINOPHEN AND CODEINe',
        'ACETAMINOPHEN AND CODEINE PHOSPHATE',
        25,
        96.34,
        12
    );
insert into product (
        id_product,
        product_name,
        description,
        quantity,
        price,
        iva
    )
values ('SWIN', 'OXYGEN', 'OXYGEN', 19, 9.9, 0);
insert INTO invoice(
        invoice_number,
        customer,
        emission_date,
        sub_total,
        iva,
        total
    )
values('3', 3, '2022-11-13', 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(1, 'NUS', 2, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(1, 'SCHN', 3, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(1, 'DPG', 4, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(2, 'CFCO', 1, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(2, 'ELOS', 2, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(2, 'AMWD', 1, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(2, 'BANC', 2, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(3, 'GEC', 1, 0, 0, 0);
insert into invoice_detail(
        invoice,
        product,
        quantity,
        sub_total,
        iva,
        total
    )
values(3, 'SWIN', 1, 0, 0, 0);
select *
from invoice;
create view view_invoices as
select c.id_customer,
    c.first_name,
    c.last_name,
    c.email,
    c.phone,
    c.card_id,
    c.address,
    p.id_product,
    p.product_name,
    p.description,
    p.price,
    f.id_invoice,
    f.invoice_number,
    f.emission_date,
    f.sub_total,
    f.iva,
    f.total,
    id.id_detail,
    id.invoice,
    id.product,
    id.quantity,
    id.sub_total,
    id.iva,
    id.total
from customer as c,
    product as p,
    invoice as f,
    invoice_detail as id
where c.id_customer = f.customer
    and f.id_invoice = id.invoice
    and p.id_product = id.product;
select *
from view_invoices
where id_customer = 3;
--------------------------------------------------------------------------------------------------------
CREATE TABLE user_type(
    id_user_type INTEGER NOT NULL auto_increment,
    name_user_type VARCHAR(100) NOT NULL,
    CONSTRAINT pk_user_type PRIMARY KEY (id_user_type)
);
CREATE TABLE users(
    id_users VARCHAR(13) NOT NULL,
    user_first_name VARCHAR(50) NOT NULL,
    user_last_name VARCHAR(50) NOT NULL,
    user_addres VARCHAR(100) NOT NULL,
    user_gender INTEGER NOT NULL,
    user_register_date DATE NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_phone VARCHAR(15) NOT NULL,
    user_type INTEGER NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id_users),
    CONSTRAINT fk_usertype_user FOREIGN KEY (user_type) REFERENCES user_type(id_user_type)
);
CREATE TABLE car(
    id_car INTEGER NOT NULL auto_increment,
    car_colour VARCHAR(50) NOT NULL,
    car_vin VARCHAR(25) NOT NULL UNIQUE,
    car_mark VARCHAR(25) NOT NULL,
    car_model VARCHAR(25) NOT NULL,
    car_year INTEGER NOT NULL,
    car_owner VARCHAR(13) NOT NULL,
    CONSTRAINT pk_car PRIMARY KEY (id_car),
    CONSTRAINT fk_user_car FOREIGN KEY (car_owner) REFERENCES users(id_users)
);
CREATE TABLE maintenance(
    id_maintenance INTEGER NOT NULL auto_increment,
    maintenance_name VARCHAR(100) NOT NULL,
    car INTEGER NOT NULL,
    users VARCHAR(13) NOT NULL,
    date_maintenance DATE NOT NULL,
    description VARCHAR(200) NOT NULL,
    subtotal NUMERIC(8, 2) NOT NULL,
    iva NUMERIC(8, 2) NOT NULL,
    total NUMERIC(8, 2) NOT NULL,
    CONSTRAINT pk_maintenance PRIMARY KEY (id_maintenance),
    CONSTRAINT fk_user_main FOREIGN KEY (users) REFERENCES users(id_users),
    CONSTRAINT fk_car_main FOREIGN KEY (car) REFERENCES car(id_car)
);
CREATE TABLE product_service(
    id_product VARCHAR(20) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_description VARCHAR(100) NOT NULL,
    quantity INTEGER NOT NULL,
    price NUMERIC(8, 2) NOT NULL,
    iva NUMERIC(8, 2) NOT NULL,
    CONSTRAINT pk_suplier PRIMARY KEY (id_product)
);
CREATE TABLE maintenance_detail(
    id_detail INTEGER NOT NULL auto_increment,
    maintenance INTEGER NOT NULL,
    product_service VARCHAR(20) NOT NULL,
    quantity INTEGER NOT NULL,
    subtotal NUMERIC(8, 2) NOT NULL,
    iva NUMERIC(8, 2) NOT NULL,
    total NUMERIC(8, 2) NOT NULL,
    CONSTRAINT pk_detail PRIMARY KEY (id_detail),
    CONSTRAINT fk_product_md FOREIGN KEY (product_service) REFERENCES product_service(id_product),
    CONSTRAINT fk_main_detail FOREIGN KEY (maintenance) REFERENCES maintenance(id_maintenance)
);
insert into user_type(name_user_type)
values('Customer - Owner Car');
insert into user_type(name_user_type)
values('Management Mechanic');
insert into user_type(name_user_type)
values('Employee - Mechanic');