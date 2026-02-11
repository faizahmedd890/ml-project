FROM python:3.10-slim

WORKDIR /app

# Copy only requirements first (better caching)
COPY flask_app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of app
COPY flask_app/ .

COPY models/vectorizer.pkl /app/models/vectorizer.pkl

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "app:app"]
