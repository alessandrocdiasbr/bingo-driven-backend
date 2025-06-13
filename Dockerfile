
FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache openssl

COPY package*.json ./

RUN npm install

COPY . .

RUN npx prisma generate

EXPOSE 5000

CMD ["sh", "-c", "npm run build && npx prisma migrate deploy && node dist/server.js"]