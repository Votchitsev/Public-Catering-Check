FROM python:alpine

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY . .

VOLUME [ "/app/data" ]

RUN pip install -r requirements.txt

RUN python manage.py makemigrations && python manage.py migrate

CMD [ "uvicorn", "check_list.asgi:application", "--reload", "--host", "0.0.0.0", "--port", "80"]
