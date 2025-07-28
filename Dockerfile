# Menggunakan base image Node.js versi 14
FROM node:14

# Set working directory di dalam container
WORKDIR /app

# Copy semua source code ke dalam container
COPY . .

# Set environment untuk production & database host
ENV NODE_ENV=production DB_HOST=item-db

# Install dependencies production & build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080
EXPOSE 8080

# Jalankan aplikasi saat container start
CMD ["npm", "start"]