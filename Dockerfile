FROM node:18-alpine
WORKDIR /app
RUN apk add --no-cache openssl
COPY package*.json ./
RUN npm install --include=dev
COPY . .
RUN npm run build
RUN npx prisma generate
EXPOSE 5000
CMD ["npm", "start"]