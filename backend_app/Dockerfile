FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED=1

WORKDIR /app/backend_app

COPY requirements.txt /app/backend_app/requirements.txt


RUN pip3 install -r requirements.txt

COPY . /app/backend_app

#CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

