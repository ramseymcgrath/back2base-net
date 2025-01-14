# Use a small Python base image
FROM python:3.13-slim

# Create and set work directory
WORKDIR /app

# Copy requirements first (for better caching)
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the code
COPY worker /app/worker

# Expose no ports, since this is a worker (unless you need HTTP for health checks)
# EXPOSE 8000

# Set the default command to run the worker
CMD ["python", "worker/main.py"]
