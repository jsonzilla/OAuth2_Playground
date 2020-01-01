# OAuth2_Playground
WIP de lib para integrar a proteção para a comunição com o KeyCloack/Certificador

## Baixar os submodulos
````
git submodule update --init --recursive
````

## Build
```
mkdir build
cd build
cmake -G "Visual Studio 16 2019" ..\src\
```

## JWT++ Processamento dos tokens JWT
https://github.com/Thalhammer/jwt-cpp

Possui três dependencias
* nlohmann
* picojson
* OpenSSL

https://github.com/yhirose/cpp-httplib

Possui a dependencia
* OpenSSL

## Sobre o OpenSSL
A versão que temos atualmente em nossa base não nos atende, apresenta uma incompátibilidade de métodos e por ser gerada na forma dinâmica, não oferece a robustez que necessitamos na proteção.

Foi baixado a https://github.com/openssl/openssl/ na tag openssl-3.0.0 e compilada para VS2019 (já que é um POC WIP).

Para gerar é necessário ter o Perl e Masm instalado conforme descreve na documentação.
Abaixo exemplos das bat usadas para gerar.

Dinânico
```
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
mkdir _build
cd _build
perl ..\Configure VC-WIN64A-masm makedepend fips shared
perl configdata.pm --dump
cd _build
nmake build_all_generated
nmake PERL=no-perl
cd ..
cd _build
mkdir ..\_install
cmd /c "nmake install DESTDIR=..\_install 2>&1"
cd ..
```

Estático (FIPS força gerar shared!)
```
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
mkdir _build
cd _build
perl ..\Configure VC-WIN64A-masm makedepend no-fips no-shared
perl configdata.pm --dump
cd _build
nmake build_all_generated
nmake PERL=no-perl
cd ..
cd _build
mkdir ..\_install
cmd /c "nmake install DESTDIR=..\_install 2>&1"
cd ..
```


