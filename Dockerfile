# Use an official Python base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy requirements and install dependencies
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY app/ .

# Expose the port Flask runs on
EXPOSE 3000


# Run the Flask app
CMD ["python3", "app.py"]
