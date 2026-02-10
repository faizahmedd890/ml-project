FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements first (better caching)
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY flask_app/ /app/

# Create models directory and copy model
RUN mkdir -p /app/models
COPY models/vectorizer.pkl /app/models/vectorizer.pkl

# Download NLTK data
RUN python -m nltk.downloader stopwords wordnet

# Expose Flask port
EXPOSE 5000

# ---- Local run ----
CMD ["python", "app.py"]

# ---- Production (use this instead for prod) ----
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "app:app"]
