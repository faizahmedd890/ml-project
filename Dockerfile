FROM python:3.10-slim

WORKDIR /app

# 1️⃣ Copy ONLY requirements first (for caching)
COPY requirements.txt .

# 2️⃣ Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 3️⃣ Download NLTK data
RUN python -m nltk.downloader stopwords wordnet

# 4️⃣ Copy application code
COPY flask_app/ /app/
COPY models/vectorizer.pkl /app/models/vectorizer.pkl

EXPOSE 5000

# Production
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "app:app"]
