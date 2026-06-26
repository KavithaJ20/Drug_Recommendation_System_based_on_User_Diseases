# Credit Card Fraud Detection System using Machine Learning and Flask

## Project Overview

The Credit Card Fraud Detection System is a Machine Learning-based web application designed to identify fraudulent credit card transactions in real time. The system uses a trained ML model to analyze transaction details and classify them as either **Fraudulent** or **Legitimate**. A Flask web application provides a simple and interactive interface for users to test transactions.


## Objectives

- Detect fraudulent credit card transactions accurately.
- Minimize financial losses caused by fraud.
- Provide real-time prediction using Machine Learning.
- Build a user-friendly web interface using Flask.

---

## Features

- Machine Learning-based fraud detection.
- Real-time transaction prediction.
- User-friendly Flask web interface.
- Fast and accurate classification.
- Easy deployment on a local server.
- Scalable for future improvements.

---

# Technologies Used

### Programming Language
- Python

### Machine Learning
- Scikit-learn
- Pandas
- NumPy

### Web Framework
- Flask

### Frontend
- HTML
- CSS
- Bootstrap

### Development Tools
- Jupyter Notebook
- Visual Studio Code
- Anaconda

---

##  Project Structure

```
Credit-Card-Fraud-Detection/
│
├── static/
│   ├── css/
│   ├── images/
│
├── templates/
│   ├── index.html
│
├── model/
│   ├── fraud_model.pkl
│
├── app.py
├── train_model.py
├── requirements.txt
├── README.md
└── dataset.csv
```

---

##  How It Works

1. The user enters transaction details through the web interface.
2. Flask receives the input data.
3. The trained Machine Learning model processes the data.
4. The model predicts whether the transaction is:
   -  Legitimate Transaction
   -  Fraudulent Transaction
5. The prediction is displayed instantly on the webpage.

---

##  Machine Learning Workflow

- Data Collection
- Data Preprocessing
- Feature Selection
- Model Training
- Model Evaluation
- Model Saving
- Flask Integration
- Real-Time Prediction

---

## Installation

### Clone the repository

```bash
git clone https://github.com/yourusername/Credit-Card-Fraud-Detection.git
```

### Navigate to the project

```bash
cd Credit-Card-Fraud-Detection
```

### Install dependencies

```bash
pip install -r requirements.txt
```

### Run the application

```bash
python app.py
```

Open your browser and visit:

```
http://127.0.0.1:5000
```

---

## Input

The system accepts transaction-related details required by the trained model.

Example:

- Transaction Amount
- Transaction Features
- Other encoded attributes from the dataset

---

##  Output

The system predicts one of the following:

-  Legitimate Transaction
-  Fraudulent Transaction


##  Future Enhancements

- Deep Learning-based fraud detection.
- Live transaction monitoring.
- Database integration.
- User authentication.
- Cloud deployment.
- REST API support.
- Model retraining with new data.

---

## Requirements

- Python 3.10+
- Flask
- Scikit-learn
- Pandas
- NumPy
- Joblib

Install all dependencies using:

```bash
pip install -r requirements.txt
```

---

## Author

**Kavitha J**




