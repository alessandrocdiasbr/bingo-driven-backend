# bingo-driven

Sistema para a administração de jogos de bingo.

[demonstração do bingo](demo-bingo.gif)

## 🚀 Deploy

A aplicação está no ar e pode ser acessada pelos seguintes links:

- **Front-end (Vercel):** `https://bingo-driven-front.vercel.app/`
- **Back-end (Render):** `https://bingo-driven-backend-sk9a.onrender.com`

---

## ⚙️ Tecnologias

- **Back-end:** Node.js, Express, Typescript, Jest e Prisma. 
- **Banco de dados:** Postgres. 
- **Front-end:** React e Vite. 
- **DevOps:** Docker, Docker Compose, GitHub Actions, Render, Vercel.

---

## 💻 Executando Localmente com Docker

Você pode executar toda a aplicação localmente utilizando Docker.

### Com Docker Compose (Recomendado)

Este método sobe o back-end, o front-end e o banco de dados com um único comando.

1.  Clone os repositórios do back-end e do front-end na mesma pasta:
    ```bash
    /bingo-project
    ├── back-end/
    └── front-end/
    ```

2.  No diretório `front-end`, crie um arquivo `.env` com o seguinte conteúdo, para que ele possa se comunicar com o back-end local:
    ```
    VITE_BACKEND=http://localhost:5000
    ```

3.  Navegue até a pasta `back-end` e execute o comando:
    ```bash
    docker-compose up --build
    ```

4.  Acesse `http://localhost:8080` no seu navegador.

### Apenas com Docker (Manual)

Se preferir, você pode subir apenas o contêiner do back-end. Você precisará ter uma instância do PostgreSQL rodando e acessível.

1.  Construa a imagem Docker na raiz do projeto back-end:
    ```bash
    docker build -t bingo-backend .
    ```

2.  Execute o contêiner, passando a URL do seu banco de dados na variável de ambiente:
    ```bash
    docker run -p 5000:5000 -e DATABASE_URL="[SUA_URL_DE_CONEXAO_COM_O_POSTGRES]" --name bingo-api bingo-backend
    ```

---

## 🛠️ Desenvolvimento (Sem Docker)

- O projeto é fullstack e é necessário subir ambos front-end e back-end separadamente. 
- **Para o back-end:**
  - Instalar as dependências com o `npm i`; 
  - Criar o arquivo `.env` com base no exemplo do `.env.example`; 
  - Preparar o banco de dados usando o prisma (`prisma migrate dev`); 
  - Executar o comando `npm run dev`. 
- **Para executar os testes do back-end:**
  - Criar o arquivo `.env.test` com base no exemplo do `.env.example`; 
  - Prearar o banco de dados usando o Prisma (`npm run test:migration`); 
  - Executar o comando `npm run test`.
