FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV PYTHONUNBUFFERED=1

EXPOSE 5000
ENTRYPOINT ["/app/entrypoint.sh"]