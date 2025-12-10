FROM n8nio/n8n:1.45.1
ENV N8N_RELEASE_TYPE=docker
# Render sets $PORT automatically
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
# Ensure config directory exists
RUN mkdir -p /home/node/.n8n
# Expose n8n port
EXPOSE 5678
CMD ["n8n"]