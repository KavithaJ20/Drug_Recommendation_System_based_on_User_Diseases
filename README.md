# Drugs Recommendation Based on User Diseases

## Project Overview

The Drugs Recommendation Based on User Diseases project is a Machine Learning-based application designed to recommend suitable medications based on a user's disease. The system analyzes patient reviews and medical data using various text processing and classification techniques to identify the most appropriate drug recommendation. The objective is to assist users and healthcare professionals in making informed decisions while reducing the burden on medical specialists.

---

## Objectives

- Recommend appropriate drugs based on user diseases.
- Improve the accuracy of medicine recommendations using Machine Learning.
- Reduce manual effort in identifying suitable medications.
- Assist healthcare professionals with data-driven recommendations.
- Enhance the efficiency of the drug recommendation process.

---

## Features

- User Registration and Login
- User Profile Management
- Dataset Upload
- Disease-Based Drug Recommendation
- Machine Learning-Based Prediction
- Secure User Authentication
- Simple and User-Friendly Interface

---

## Technologies Used

### Programming Language
- Python

### Machine Learning
- Scikit-learn
- Pandas
- NumPy

### Natural Language Processing
- TF-IDF
- Bag of Words (BoW)
- Word2Vec

### Web Technologies
- HTML
- CSS
- Flask

### Database
- MySQL

### Development Tools
- Visual Studio Code
- Jupyter Notebook
- Anaconda

---

## Project Structure

```
Drugs-Recommendation-System/
│
├── static/
│   ├── css/
│   ├── images/
│
├── templates/
│   ├── index.html
│   ├── login.html
│   ├── register.html
│   ├── recommendation.html
│
├── dataset/
│   ├── drugs_dataset.csv
│
├── model/
│   ├── recommendation_model.pkl
│
├── app.py
├── train_model.py
├── requirements.txt
├── README.md
└── database.sql
```

---

## System Workflow

1. User registers and logs into the system.
2. The dataset is uploaded and processed.
3. The user enters the disease name.
4. The Machine Learning model analyzes the input.
5. The system recommends the most suitable drug.
6. The recommendation is displayed to the user.

---

## Machine Learning Workflow

- Data Collection
- Data Preprocessing
- Text Vectorization
- Feature Extraction
- Model Training
- Model Evaluation
- Drug Recommendation
- Web Application Integration

---

## Algorithm Used

- Support Vector Machine (SVM)

The Support Vector Machine (SVM) algorithm is used as the primary classification technique for predicting the most suitable drug recommendations based on disease-related information. :contentReference[oaicite:1]{index=1}

---

## Installation

### Navigate to the Project

```bash
cd Drugs-Recommendation-System
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Run the Application

```bash
python app.py
```

Open your browser and visit:

```
http://127.0.0.1:5000
```

---

## Input

- User Disease
- Medical Dataset
- Patient Review Data (if applicable)

---

## Output

The system predicts and recommends the most suitable drug for the entered disease based on the trained Machine Learning model.

---

## Modules

- User Registration
- User Login
- Profile Management
- Dataset Upload
- Disease Input
- Drug Recommendation
- Logout

These modules correspond to the project's user workflow. :contentReference[oaicite:2]{index=2}

---

## Future Enhancements

- Deep Learning-based recommendation models
- Real-time medical database integration
- Personalized medicine recommendations
- API integration with healthcare platforms
- Mobile application support
- Cloud deployment
- Multi-language support

---

## Hardware Requirements

- Intel Core i3 Processor or above
- Minimum 4 GB RAM
- 40 GB Hard Disk
- 64-bit Operating System

---

## Software Requirements

- Windows 10 or Windows 11
- Python 3.x
- Flask
- MySQL
- HTML
- CSS
- Visual Studio Code
- Jupyter Notebook

---

## Conclusion

This project demonstrates how Machine Learning and Natural Language Processing techniques can be applied to recommend appropriate drugs based on user diseases. The system improves recommendation accuracy, reduces manual effort, and provides a reliable decision-support tool for healthcare applications.

