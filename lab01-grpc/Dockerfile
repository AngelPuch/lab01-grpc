FROM python:3.11-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app:/app/generated

RUN pip install --no-cache-dir \
    grpcio==1.59.0 \
    grpcio-tools==1.59.0 \
    protobuf==4.24.3

COPY proto/ ./proto/

RUN mkdir -p generated && \
    python -m grpc_tools.protoc \
    -I./proto \
    --python_out=./generated \
    --grpc_python_out=./generated \
    ./proto/calculadora.proto

COPY servidor/ ./servidor/

EXPOSE 50051

CMD ["python", "servidor/server.py"]
