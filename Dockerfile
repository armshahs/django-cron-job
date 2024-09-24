# Base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Install cron
RUN apt-get update && apt-get install -y cron

# Copy your project
COPY . .

# Set up cron job
RUN echo "* * * * * root python /app/manage.py my_cron_task >> /var/log/cron.log 2>&1" >> /etc/crontab

# Start cron service and Django
CMD cron && gunicorn cron_project.wsgi:application --bind 0.0.0.0:8000
