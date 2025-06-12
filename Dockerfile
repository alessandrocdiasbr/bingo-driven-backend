
FROM node:20-alpine AS builder
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .


RUN npx prisma generate

RUN npm run build

FROM node:20-alpine AS production
WORKDIR /app

RUN apk add openssl

ENV NODE_ENV=production

COPY package*.json ./

RUN npm install --omit=dev

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma

EXPOSE 5000

CMD ["sh", "-c", "npx prisma migrate deploy && node dist/server.js"]