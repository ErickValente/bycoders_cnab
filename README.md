

<h1 align="center">Projeto ByCoders - Cnab</h1>

<p align="center">
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-obsevações">Observações</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-documentação">Documentação</a>
</p>

## ✨ Tecnologias

  O Projeto completo foi desenvolvido com as seguintes tecnologias:

- Webservice com Python(Flask)
- FrontEnd com Flutter(dart)
- PostgreSQL 11

## 🚀 Observações

> Obs.: Nesse projeto utilizei o Python como webservice para o consumo de dados no Postgree.

> O front foi construído com Flutter, onde faz a leitura do arquivo txt e o interpreta, enviando apenas os dados ao webservice.


## 📄 Documentação

  Para rodar o projeto precisamos instalar o Python em sua versão superior a 3, após rodar os comandos abaixo:

> pip install psycopg2
> pip install flask
> pip install flask_cors

  O proximo passo será criar uma database em seu PostGreeSQL, conforme segue:

> criar um db com o nome BYCODERS
> importar o arquivo bycoders.sql na função restore

  Pronto! agora é só executar o main.py da pasta webservice

  Para subir o frontend basta acessar o caminho /portal_cnab/build/web, copiar o conteúdo e inserir em um xampp, wampp ou tomcat

  Tudo funcionando!

---

Para testes, deixei também esse projeto rodando em meu servidor, basta acessar: http://187.180.146.210:2020/bycoders