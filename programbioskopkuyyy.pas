program BioskopKuyy;

uses crt;

type
    Film = record
        judul: string[50];
        genre: string[20];
        episode: integer;
        rating: real;
        sinopsis: string[255];
        umurMin: integer;
    end;

var
    pilihanTempat, pilihanJenisFilm, pilihanFilm: integer;
    umur: integer;
    anime, kartun, drakor: array[1..3] of Film;

// Prosedur untuk menampilkan pilihan tempat
procedure TampilkanPilihanTempat();
begin
    writeln('Mau nonton bioskop dimana?');
    writeln('1. XXI');
    writeln('2. CGV');
    writeln('3. Bioskop Lain');
    write('Pilih (1-3): ');
    readln(pilihanTempat);
end;

// Prosedur untuk menampilkan jenis film
procedure TampilkanJenisFilm();
begin
    writeln('Mau nonton apa?');
    writeln('1. Anime');
    writeln('2. Kartun');
    writeln('3. Drakor');
    write('Pilih (1-3): ');
    readln(pilihanJenisFilm);
end;

// Prosedur untuk menampilkan daftar film
procedure TampilkanFilm(films: array of Film);
var
    i: integer;
begin
    writeln('Berikut daftar film:');
    for i := Low(films) to High(films) do
    begin
        writeln(i, '. ', films[i].judul, ' (', films[i].genre, ')');
        writeln('   Episode: ', films[i].episode, ', Rating: ', films[i].rating:0:1);
        writeln('   Sinopsis: ', films[i].sinopsis);
        writeln('   Batas umur: ', films[i].umurMin, '+');
        writeln;
    end;
end;

// Prosedur untuk memilih film
procedure PilihFilm(films: array of Film);
begin
    write('Pilih film (nomor): ');
    readln(pilihanFilm);

    if (pilihanFilm >= Low(films)) and (pilihanFilm <= High(films)) then
    begin
        if umur >= films[pilihanFilm].umurMin then
        begin
            writeln('Selamat menonton ', films[pilihanFilm].judul, '!');
        end
        else
        begin
            writeln('Maaf, Anda belum cukup umur untuk menonton film ini.');
        end;
    end
    else
    begin
        writeln('Pilihan tidak valid.');
    end;
end;

// Prosedur untuk menginisialisasi data film
procedure InisialisasiFilm();
begin
    // Data Anime
    anime[1].judul := 'Naruto';
    anime[1].genre := 'Action';
    anime[1].episode := 500;
    anime[1].rating := 8.3;
    anime[1].sinopsis := 'Seorang ninja bercita-cita menjadi Hokage.';
    anime[1].umurMin := 13;

    anime[2].judul := 'Attack on Titan';
    anime[2].genre := 'Adventure';
    anime[2].episode := 87;
    anime[2].rating := 9.0;
    anime[2].sinopsis := 'Pertarungan manusia melawan titan.';
    anime[2].umurMin := 18;

    anime[3].judul := 'One Piece';
    anime[3].genre := 'Adventure';
    anime[3].episode := 1000;
    anime[3].rating := 8.9;
    anime[3].sinopsis := 'Petualangan mencari harta karun terbesar.';
    anime[3].umurMin := 13;

    // Data Kartun
    kartun[1].judul := 'SpongeBob SquarePants';
    kartun[1].genre := 'Comedy';
    kartun[1].episode := 276;
    kartun[1].rating := 7.8;
    kartun[1].sinopsis := 'Kehidupan SpongeBob dan teman-temannya di Bikini Bottom.';
    kartun[1].umurMin := 7;

    kartun[2].judul := 'Dora the Explorer';
    kartun[2].genre := 'Education';
    kartun[2].episode := 178;
    kartun[2].rating := 6.3;
    kartun[2].sinopsis := 'Petualangan seru Dora dan Boots.';
    kartun[2].umurMin := 3;

    kartun[3].judul := 'Tom and Jerry';
    kartun[3].genre := 'Comedy';
    kartun[3].episode := 162;
    kartun[3].rating := 8.2;
    kartun[3].sinopsis := 'Pertarungan abadi antara Tom dan Jerry.';
    kartun[3].umurMin := 7;

    // Data Drakor
    drakor[1].judul := 'Crash Landing on You';
    drakor[1].genre := 'Romance';
    drakor[1].episode := 16;
    drakor[1].rating := 8.7;
    drakor[1].sinopsis := 'Cinta antara seorang pewaris Korea Selatan dan tentara Korea Utara.';
    drakor[1].umurMin := 16;

    drakor[2].judul := 'Goblin';
    drakor[2].genre := 'Fantasy';
    drakor[2].episode := 16;
    drakor[2].rating := 8.9;
    drakor[2].sinopsis := 'Kisah seorang goblin yang mencari pengantinnya.';
    drakor[2].umurMin := 18;

    drakor[3].judul := 'Itaewon Class';
    drakor[3].genre := 'Drama';
    drakor[3].episode := 16;
    drakor[3].rating := 8.3;
    drakor[3].sinopsis := 'Perjuangan seorang pemuda membangun restoran dan membalas dendam.';
    drakor[3].umurMin := 16;
end;

begin
    clrscr;
    InisialisasiFilm();

    writeln('Selamat datang di program Bioskop Kuyy!');
    write('Masukkan umur Anda: ');
    readln(umur);

    TampilkanPilihanTempat();
    TampilkanJenisFilm();

    case pilihanJenisFilm of
        1: TampilkanFilm(anime);
        2: TampilkanFilm(kartun);
        3: TampilkanFilm(drakor);
    else
        writeln('Pilihan tidak valid.');
    end;

    if (pilihanJenisFilm >= 1) and (pilihanJenisFilm <= 3) then
    begin
        case pilihanJenisFilm of
            1: PilihFilm(anime);
            2: PilihFilm(kartun);
            3: PilihFilm(drakor);
        end;
    end;

    writeln('Terima kasih telah menggunakan program Bioskop Kuyy!');
end.

