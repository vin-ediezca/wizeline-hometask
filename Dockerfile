FROM kierra/safelink_uitest_base:latest

# Dependencies installation
RUN apt-get update && \
    apt-get install -y \
        git x11vnc

# Set environment variable for display  
ENV DISPLAY :20

# Expose port 5920 to view display using VNC Viewer
EXPOSE 5920

COPY . /app
WORKDIR /app

# CMD ["/run.sh"]