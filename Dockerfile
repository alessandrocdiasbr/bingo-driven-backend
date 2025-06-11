
FROM node:20-alpine AS deps
WORKDIR /app


COPY package.json package-lock.json ./

RUN npm install --omit=dev

FROM node:20-alpine AS builder
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npx prisma generate
RUN npm run build # Supondo que você tenha um script "build" em package.json para compilar o TS


FROM node:20-alpine AS production
WORKDIR /app


ENV NODE_ENV=production

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/dist ./dist

EXPOSE 5000


CMD ["sh", "-c", "npx prisma migrate deploy && node dist/server.js"]