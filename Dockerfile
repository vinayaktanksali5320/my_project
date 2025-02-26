FROM python:3.12-alpine

RUN mkdir /app

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

COPY requirements.txt /app/

RUN python -m pip install --upgrade pip

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]