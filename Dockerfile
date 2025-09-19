# Stage 1 — build (install deps)
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .

# Stage 2 — runtime (minimal)
FROM node:18-alpine AS runtime
WORKDIR /app

# create non-root user + group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# copy only what we need from builder
COPY --from=builder /app /app

# set production env and non-root user
ENV NODE_ENV=production
USER appuser

EXPOSE 3000
CMD ["node", "index.js"]
