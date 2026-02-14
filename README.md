# Movie Review Sentiment Analysis (NLP Project)

This project is an end-to-end Machine Learning application that predicts whether a movie review is **Positive** or **Negative** using Natural Language Processing (NLP).

## Project Overview

The goal of this project is to automatically understand the sentiment of a user’s movie review. The model reads the review text and returns the prediction.

## Steps I Performed

1. Collected a movie review dataset.
2. Cleaned the text data by removing punctuation, stopwords, and converting text to lowercase.
3. Converted text into numbers using **TF-IDF Vectorization** because machine learning models work with numerical data.
4. Trained a **Logistic Regression** classification model.
5. Evaluated the model using Accuracy and F1-score.

## Deployment

* Built a REST API using **FastAPI**
* Containerized the application using **Docker**
* Tracked experiments using **MLflow**
* Implemented CI/CD using **GitHub Actions**
* Deployed the model on **AWS EC2**

Now a user can send a movie review to the API and the model returns whether the review is positive or negative.

## Tech Stack

Python, Scikit-learn, NLTK, FastAPI, Docker, MLflow, GitHub Actions, AWS
