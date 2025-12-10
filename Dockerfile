FROM node:18-alpine
# Install required packages
RUN apk add --no-cache \
    bash \
    python3 \
    make \
    g++ \
    tzdata
# Create user and directories
RUN addgroup -g 1000 nodejs && adduser -S -u 1000 -G nodejs node
USER node
WORKDIR /home/node
# Install n8n globally
RUN npm install -g n8n@1.45.1
# Expose port
EXPOSE 5678
# Fix permission issues on Render/Railway
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV N8N_RELEASE_CHANNEL=stable
# Start n8n
CMD ["n8n", "start"]