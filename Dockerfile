FROM python:3.6

ENV PYTHONUNBUFFERED 1

COPY app /usr/src/app

ENV PKG_PATH=/usr/src/app
WORKDIR $PKG_PATH

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN python manage.py makemigrations polls && python manage.py migrate

EXPOSE 8000

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]