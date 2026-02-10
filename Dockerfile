FROM python:3.10-slim

WORKDIR /app

# Copy requirements first (important for caching)
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY flask_app/ /app/

# Create models directory and copy model
RUN mkdir -p /app/models
COPY models/vectorizer.pkl /app/models/vectorizer.pkl

# Download NLTK data
RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

# Production
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "app:app"]
