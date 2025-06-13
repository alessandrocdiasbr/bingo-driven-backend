
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./

RUN npm install --include=dev

RUN npm install -g typescript prisma

COPY . .

RUN npx prisma generate

RUN npm run build


FROM node:18-alpine
WORKDIR /app
RUN apk add --no-cache openssl
COPY package*.json ./
RUN npm install --omit=dev
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma
EXPOSE 5000
CMD ["npm", "start"]