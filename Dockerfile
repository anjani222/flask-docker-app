# Use a lightweight Python runtime
FROM python:3.13-slim

# Avoid bytecode files and send Python logs immediately
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Install dependencies first for better build caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create a non-root user
RUN groupadd --gid 10001 appuser \
    && useradd --uid 10001 --gid appuser --create-home appuser

# Copy the application
COPY --chown=appuser:appuser app.py .

# Run the application without root privileges
USER appuser

# Document the application port
EXPOSE 5000

# Check whether the application responds
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:5000/health', timeout=3)" || exit 1

# Start Gunicorn with one application worker
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "1", "--access-logfile", "-", "--error-logfile", "-", "app:app"]