# Use a Python-specific base image
FROM python:3.11-alpine

# Set working directory
WORKDIR /app

# Install dependencies
RUN apk update && apk add --no-cache \
    python3-dev \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    && python3 -m venv /venv \
    && /venv/bin/pip install --upgrade pip

# Copy application files
COPY . .

# Install Python requirements inside the virtual environment
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Set environment variables for the virtual environment
ENV PATH="/venv/bin:$PATH"

# Command to run the application
CMD ["python3", "webapp.py"]